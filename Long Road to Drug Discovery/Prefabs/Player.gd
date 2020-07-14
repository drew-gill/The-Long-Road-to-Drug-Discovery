extends KinematicBody2D

var money = 1000000
var years = 20
var backups = 0
export var playerNumber = 1 #Player 1 vs Player 2, for example

export (int) var movementSpeed = 75
var movementTarget = Vector2()
var movementVelocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	setAnimation()
	movementTarget = self.position
	
func setPlayerNumber(num):
	playerNumber = num
	
func getPlayerNumber():
	return playerNumber
	
func getPlayerMoney():
	return money

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

func _input(event):
	if event is InputEventMouseButton:
		movementTarget = event.position
	
func _physics_process(delta):
	if(playerNumber == $"../PlayerTracker".getCurrentPlayer()):
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
