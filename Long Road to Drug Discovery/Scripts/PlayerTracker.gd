extends Node2D

#up to player 4, if there are 4 total players
var currentPlayer = 1

func _ready():
	pass


func endTurn():
	if(currentPlayer + 1 > GlobalVar.num_players):
		currentPlayer = 1
	else:
		currentPlayer += 1

func getCurrentPlayerNumber():
	return currentPlayer

func getCurrentPlayerNode():
	return get_node("../Player" + str(currentPlayer))
	
