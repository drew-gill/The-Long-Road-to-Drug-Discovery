extends Node2D

var turnSequence = ["Roll", "Move", "Dialogue", "Confirm"]
var turnSequenceNumber = 0

#up to player 4, if there are 4 total players
var currentPlayer = 1

func _ready():
	pass


func endTurn():
	if(currentPlayer + 1 > GlobalVar.num_players):
		currentPlayer = 1
	else:
		currentPlayer += 1
		
	nextInTurnSequence()
	yield(get_tree().create_timer(5.0), "timeout")
	get_node("../ScrollingCamera").SetActiveLevelNumber(getCurrentPlayerNode().getCurrentLevel())

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
	
