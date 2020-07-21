extends Node2D

export var LevelNumber = 0
export (NodePath) var StartingTilePath 
var startingTile

func _ready():
	startingTile = get_node(StartingTilePath)

func getLevelNumber():
	return LevelNumber
	
func getStartingTile():
	return startingTile
