extends Node2D


onready var tile: Tile = $"/root/GlobalVar"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Player_landed(player, TileType, tiletype,  LandOnLevel, LandOnCost, LandOnTime):
	player.alterPlayerMoney(LandOnCost)
	player.alterPlayerYears(LandOnTime)
	if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
		levelUp(player)
	else:
		tryAgain(player)


func levelUp(player):
	var starting = LandOnLevel.getStartingTile()
	starting.set_piece(player)
	player.alterCurrentLevel(1)
	get_node("../../ScrollingCamera").SetActiveLevelNumber(player.getCurrentLevel())
	
func tryAgain(player):
	var starting = get_parent().getStartingTile()
	starting.set_piece(player)
