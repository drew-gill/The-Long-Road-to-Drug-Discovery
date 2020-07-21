extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_pieces()



func generate_pieces() -> void:
	var new_piece = load("res://Prefabs/Player.tscn").instance()
	add_child(new_piece)
	var starting = get_node("Level1/StartingTile")
	starting.set_piece(new_piece)


