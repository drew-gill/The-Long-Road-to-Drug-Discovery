extends KinematicBody2D
class_name Player

signal player_finished

var playerDisease = ""
var playerDrugName = ""


var money = 1000000000
var years = 20
var backups = 0


#FINAL SCORE VARIABLES
var livesSaved = 0
var profitPerYear = 0

var currentLevel = 1
var currentTile = 4
export var playerNumber = 1 #Player 1 vs Player 2, for example
export (int) var movementSpeed = 125
var movementTarget = Vector2()
var movementVelocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	setAnimation()
	movementTarget = self.position
	connect("player_finished", get_node("/root/GameBoard/Level10"), "_on_player_finished")
	
func setPlayerDisease(disease):
	playerDisease = disease

func getPlayerDisease():
	return playerDisease

func setPlayerDrugName(drugName):
	playerDrugName = drugName
	
func getPlayerDrugName():
	return playerDrugName

func setPlayerNumber(num):
	playerNumber = num

func getPlayerNumber():
	return playerNumber
	
func setPlayerMoney(PlayerMoney):
	money = PlayerMoney
	
func getPlayerMoney():
	return money

func setPlayerYears(PlayerYears):
	years = PlayerYears

func getPlayerYears():
	return years
	
func getPlayerBackups():
	return backups

func alterPlayerMoney(changeValue):
	money += changeValue

func alterPlayerYears(changeValue):
	years += changeValue
	
func alterPlayerBackups(changeValue):
	backups += changeValue

func setMovementTarget(location):
	movementTarget = location
	
	
func alterCurrentLevel(changeValue):
	currentLevel += changeValue
	
func setCurrentLevel(newValue):
	currentLevel = newValue
	
func getCurrentLevel():
	return currentLevel
	
func setCurrentTile(tileNumber):
	currentTile = tileNumber

func getCurrentTile():
	return currentTile

func setLivesSaved(newValue):
	livesSaved = newValue
	
func getLivesSaved():
	return livesSaved
	
func setProfitPerYear(newValue):
	profitPerYear = newValue

func getProfitPerYear():
	return profitPerYear

#if the player livesSaved != 0, then they have finished the game.
func isFinished():
	return (livesSaved != 0)
	
func _physics_process(delta):
	if(playerNumber == get_node("../PlayerTracker").getCurrentPlayerNumber()):
		
		if (get_node("../PlayerTracker").getCurrentTurnSequence() == "Move"):
			movementVelocity = position.direction_to(movementTarget) * movementSpeed
			$MouseSprite.flip_h = movementVelocity.x > 0
				
			if(position.distance_to(movementTarget) > 5):
				movementVelocity = move_and_slide(movementVelocity)
				$MouseSprite.play()
				
			else:
				$MouseSprite.stop()
		else:
			 $MouseSprite.stop()



func setAnimation():
	if(playerNumber == 1):
		$MouseSprite.animation = "moveGray"
	elif(playerNumber == 2):
		$MouseSprite.animation = "moveBlue"
	elif(playerNumber == 3):
		$MouseSprite.animation = "moveGreen"
	elif(playerNumber == 4):
		$MouseSprite.animation = "moveYellow"
	else:
		$MouseSprite.animation = "moveGray"

func _on_Button_pressed():
	print("Money Spent: $" + str(money))
	print("Time Spent: " + str(years))


#score = ((Money * Years Left) + (LivesSaved * 5000) + money)/1000000
#Example: 
#$800 million/year for 8 years = 6.4 billion
#800,000 lives saved * 5000 = 4 billion
func getFinalScore():
	var tempYears = years
	
	if(years < 0):
		tempYears = 0
		
	return ((profitPerYear * tempYears) + (livesSaved * 5000) + money)/1000000
