extends Area2D

export var tileNumber = 1
export (int) var LandOnCost = -1000
export (int) var LandOnTime = -1
export (NodePath) var NextTilePath
export (NodePath) var LandOnLevelPath
var NextTile
var LandOnLevel

enum tiletype {START, GOOD, BAD, NEUTRAL}
export (tiletype) var TileType = tiletype.START



func _ready():
	NextTile = get_node(NextTilePath)
	LandOnLevel = get_node(LandOnLevelPath)
	var LevelProgression = 0
	if(LandOnLevel != null):
		LevelProgression = LandOnLevel.getLevelNumber() - get_parent().getLevelNumber()
	
	if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL or TileType == tiletype.START):
		if(TileType == tiletype.GOOD):
			$Sprite.texture = load("res://Custom Assets/TileSprites/shipGreen.png")
		elif(TileType == tiletype.BAD):
			$Sprite.texture = load("res://Custom Assets/TileSprites/shipPink.png")
		elif(TileType == tiletype.NEUTRAL):
			$Sprite.texture = load("res://Custom Assets/TileSprites/shipBeige.png")
		else:
			$Sprite.texture = load("res://Custom Assets/TileSprites/shipBlue.png")
	else:
		if(TileType == tiletype.GOOD):
			$Sprite.texture = load("res://Custom Assets/TileSprites/laserGreen3.png")
		elif(TileType == tiletype.BAD):
			$Sprite.texture = load("res://Custom Assets/TileSprites/laserPink3.png")
		elif(TileType == tiletype.NEUTRAL):
			$Sprite.texture = load("res://Custom Assets/TileSprites/laserBeige3.png")
		else:
			$Sprite.texture = load("res://Custom Assets/TileSprites/laserBlue3.png")

func LandOn(player):
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
	
func tryAgain(player):
	var starting = get_parent().getStartingTile()
	starting.set_piece(player)
	

func GoToNextTile(player):
	if(NextTile != null):
		player.setMovementTarget(NextTile.position+Vector2(0,-50))
		
func StopPlayer(player):
	player.setMovementTarget(self.position) #set target with offset
	
func _on_Tile_player_entered(player):
	
	if(player.getCurrentTile() == tileNumber):
		if(TileType == tiletype.START):
			StopPlayer(player)
		else:
			LandOn(player)
	else:
		GoToNextTile(player)

func set_piece(new_piece) -> void:
	new_piece.position = position +Vector2(0,-50)
