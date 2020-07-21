extends Node2D
const TILE_WIDTH = 124

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_pieces()
	generate_HUD()


func generate_pieces() -> void:
	for i in range(GlobalVar.num_players):
		var new_piece = load("res://Prefabs/Player.tscn").instance()
		new_piece.setPlayerNumber(GlobalVar.num_players - i)
		add_child(new_piece)
		new_piece.set_name("Player" + str(GlobalVar.num_players - i))
		var starting = get_node("Level1/StartingTile")
		starting.set_piece(new_piece)
		if GlobalVar.num_players - i == 1:
			new_piece.setPlayerMoney(GlobalVar.Budget1)
			new_piece.setPlayerYears(GlobalVar.Time1)
			new_piece.setPlayerDisease(GlobalVar.Disease1)
			new_piece.setPlayerDrugName(GlobalVar.DrugName1)
		elif GlobalVar.num_players - i == 2:
			new_piece.setPlayerMoney(GlobalVar.Budget2)
			new_piece.setPlayerYears(GlobalVar.Time2)
			new_piece.setPlayerDisease(GlobalVar.Disease2)
			new_piece.setPlayerDrugName(GlobalVar.DrugName2)
		elif GlobalVar.num_players - i == 3:
			new_piece.setPlayerMoney(GlobalVar.Budget3)
			new_piece.setPlayerYears(GlobalVar.Time3)
			new_piece.setPlayerDisease(GlobalVar.Disease3)
			new_piece.setPlayerDrugName(GlobalVar.DrugName3)
		elif GlobalVar.num_players - i == 4:
			new_piece.setPlayerMoney(GlobalVar.Budget4)
			new_piece.setPlayerYears(GlobalVar.Time4)
			new_piece.setPlayerDisease(GlobalVar.Disease4)
			new_piece.setPlayerDrugName(GlobalVar.DrugName4)
	
	
	
func generate_HUD():
	var newHUD = load("res://Scenes/HUD2.tscn").instance()
	add_child(newHUD)

