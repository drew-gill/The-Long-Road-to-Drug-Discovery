extends Node2D
class_name BoardTile

#access the board itself
onready var board = get_node("/root/Node2D")


# Emitted when Piece is removed from this tile
signal remove_piece
# Emitted when a new Piece is added to this tile
signal add_piece


#Set properties for each tile
var next = null
var landOnCost = null
var landOnTime = null

# Data structure for Piece node that this tile is holding
var piece = {
	"exists": false,
	"piece": null #class Piece
}
func _ready():
	pass

func get_tile_pos() -> Vector2:
	return position
	
func set_tile_pos(new_position: Vector2) -> void:
	position = new_position
	
func get_tile_coord_pos() -> Vector2:
	var coord_position = position/board.TILE_WIDTH
	coord_position.x = int(coord_position.x)
	coord_position.y = int(coord_position.y)
	return coord_position
	
func remove_piece() -> void:
	piece["exists"] = false
	piece["piece"] = null
	emit_signal("remove_piece")
	
func set_piece(new_piece) -> void:
	piece["exists"] = true
	piece["piece"] = new_piece
	
	new_piece.position = position + Vector2(board.TILE_WIDTH/2, board.TILE_WIDTH/2)
	new_piece.connect("leaving_tile", self, "remove_piece")
	
	emit_signal("add_piece")
	

func set_next(next_tile: BoardTile) -> void:
	next = next_tile

func get_next() -> BoardTile:
	return next

func set_properties(landingCost: int, landingTime: int) -> void:
	landOnCost = landingCost
	landOnTime = landingTime
	

func _on_Button_pressed():
	print("----")
	print(get_tile_coord_pos())
	print(get_next().get_tile_coord_pos())
	print(landOnCost)
	print(landOnTime)
	print("----")
