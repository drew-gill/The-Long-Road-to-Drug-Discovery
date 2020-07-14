extends Node2D
class_name Board

#Width of each tile
const TILE_WIDTH = 25

#Set dimensions for the board in terms of tiles:
#(x tiles wide, y tiles long)
const BOARD_DIMENSIONS = Vector2(14, 14)
#board_array length has to match BOARD_DIMENSIONS
var board_array = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[]
]


#Initialize the Board
func _ready():
	generate_tiles()
	generate_pieces()

#Populates the board with tiles
func generate_tiles() -> void:
	var count = 0
	for x in range(BOARD_DIMENSIONS.x):
		for y in range(BOARD_DIMENSIONS.y):
			var new_tile = load("res://Prefabs/BlueTile.tscn").instance()
			add_child(new_tile)
			new_tile.set_tile_pos(Vector2(x, y) * TILE_WIDTH)
			new_tile.set_tile_ID(count)
			board_array[x].append(new_tile)
			count += 1
			
			
func generate_specific_tiles() -> void:
	var count = 0 
	for x in range(6):
		var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
		add_child(new_tile)
		new_tile.set_tile_pos(Vector2(x, 0) * TILE_WIDTH)
		new_tile.set_tile_ID(count)
		board_array[x].append(new_tile)
		count += 1
	
	for y in range(3):
		var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
		add_child(new_tile)
		new_tile.set_tile_pos(Vector2(6, y) * TILE_WIDTH)
		new_tile.set_tile_ID(count)
		board_array[6].append(new_tile)
		count += 1
	
	for x in range(6,12):
		var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
		add_child(new_tile)
		new_tile.set_tile_pos(Vector2(x, 3) * TILE_WIDTH)
		new_tile.set_tile_ID(count)
		board_array[x].append(new_tile)
		count += 1
	

#Adds pieces
func generate_pieces() -> void:
	var new_piece = load("res://Prefabs/WhitePiece.tscn").instance()
	add_child(new_piece)
	get_tile_by_pos(Vector2(0, 0)).set_piece(new_piece)
			
	
func get_tile_by_pos(tile_pos: Vector2) -> BoardTile:
	return board_array[tile_pos.x][tile_pos.y]


func move_piece(piece: Piece, shift: Vector2):
	var current_tile = piece.get_current_tile()
	var current_pos = current_tile.get_tile_coord_pos()
	
	var dest_tile = get_tile_by_pos(current_pos+shift)
	dest_tile.set_piece(piece)
	piece.emit_signal("leaving_tile")
	
	
