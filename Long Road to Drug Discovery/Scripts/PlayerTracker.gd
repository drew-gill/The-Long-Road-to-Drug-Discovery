extends Node2D

var turnSequence = ["Roll", "Move", "Dialogue", "Confirm"]
var turnSequenceNumber = 0

#up to player 4, if there are 4 total players
var currentPlayer = 1

func _ready():
	pass


func endTurn():
	#if all players are finished, go to the final screen
	if(GlobalVar.allplayersfinished == GlobalVar.num_players):
		currentPlayer = 1
		get_node("/root/GameBoard").allPlayersFinished()
	else:
		#keep iterating to get the next player who is NOT finished
		while true:  
			if(currentPlayer + 1 > GlobalVar.num_players):
				currentPlayer = 1
			else:
				currentPlayer += 1
			if(not getCurrentPlayerNode().isFinished()):  
				break  
	
	
	
	
	nextInTurnSequence()
	get_node("../ScrollingCamera/HUD2").hide()
	yield(get_tree().create_timer(5.0), "timeout")
	get_node("../ScrollingCamera").SetActiveLevelNumber(getCurrentPlayerNode().getCurrentLevel())
	
	if(GlobalVar.allplayersfinished == GlobalVar.num_players):
		get_node("../ScrollingCamera/HUD2").hide()
	else:
		get_node("../ScrollingCamera/HUD2").show()
	
func nextInTurnSequence():
	if(turnSequenceNumber + 1 >= len(turnSequence)):
		turnSequenceNumber = 0
	else:
		turnSequenceNumber += 1

func getCurrentTurnSequence():
	return turnSequence[turnSequenceNumber]

func getCurrentPlayerNumber():
	return currentPlayer

func getCurrentPlayerNode():
	return get_node("../Player" + str(currentPlayer))
