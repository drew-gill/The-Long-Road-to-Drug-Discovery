extends Node2D

export var numOfPlayers = 1
#up to player 4, if there are 4 total players
var currentPlayer = 1

func _ready():
	pass


func endTurn():
	if(currentPlayer + 1 > numOfPlayers):
		currentPlayer = 1
	else:
		currentPlayer += 1

func getCurrentPlayer():
	return currentPlayer


#CHANGE THIS
#Identify which first space ship to land
func _on_HUD_beginMoving():
	var currentPlayerNode = get_node("../Player" + str(currentPlayer))
	
