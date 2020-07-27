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

signal transfer_phaseandroll



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
	
	#Pause for 2 seconds- add animation
	
	updateDialogue(player,1)
	yield(get_tree().create_timer(5.0), "timeout")
	
	#Alter money and years
	player.alterPlayerMoney(LandOnCost)
	player.alterPlayerYears(LandOnTime)

	if(LandOnLevel.getLevelNumber() == 1):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 2):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			#INSERT CODE FOR PURCHASING BACK-UP FORMULATIONS
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 3):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 4):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 5):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 6):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 7):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 8):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
			
	if(LandOnLevel.getLevelNumber() == 9):
		if(TileType == tiletype.GOOD or TileType == tiletype.NEUTRAL):
			levelUp(player)
		else:
			tryAgain(player)
		

func updateDialogue(player,num):
	var dialogue = get_tree().get_root().find_node("Dialogue",true,false)
	connect("transfer_phaseandroll", dialogue, "_on_transfer_phaseandroll")
	if num == 0:
		emit_signal("transfer_phaseandroll", int(player.getCurrentLevel()), 0)
	else:
		emit_signal("transfer_phaseandroll", int(player.getCurrentLevel()), player.getCurrentTile())
		
		
	 

func levelUp(player):
	player.alterCurrentLevel(1)
	updateDialogue(player,0)
	var starting = LandOnLevel.getStartingTile()
	starting.set_piece(player)
	get_node("../../ScrollingCamera").SetActiveLevelNumber(player.getCurrentLevel())
	
func tryAgain(player):
	updateDialogue(player,0)
	var starting = get_parent().getStartingTile()
	starting.set_piece(player)

func GoToNextTile(player):
	if(NextTile != null):
		player.setMovementTarget(NextTile._getTilePosition() + Vector2(0,-50))
		
func StopPlayer(player):
	player.setMovementTarget(self.position) #set target with offset
	
func _on_Tile_player_entered(player):
	get_node("Sprite/AnimationPlayer").play("UpAndDown")
	if(player.getCurrentTile() == tileNumber):
		if(TileType == tiletype.START):
			StopPlayer(player)
			yield(get_tree().create_timer(2.0), "timeout")
			get_node("Sprite/AnimationPlayer").stop()
			
		else:
			LandOn(player)
			yield(get_tree().create_timer(2.0), "timeout")
			get_node("Sprite/AnimationPlayer").stop()
	else:
		GoToNextTile(player)
		yield(get_tree().create_timer(2.0), "timeout")
		get_node("Sprite/AnimationPlayer").stop()
		

#The tile's position, with the level position accounted for.
func _getTilePosition():
	return self.get_position() + self.get_parent().get_position()

func set_piece(player) -> void:
	player.position = _getTilePosition() + Vector2(0,-50)
	GoToNextTile(player)
