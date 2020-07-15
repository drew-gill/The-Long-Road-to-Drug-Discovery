extends Node2D
class_name Board

#Width of each tile
const TILE_WIDTH = 50

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

#List of all active tiles
var active_tiles = []


#Initialize the Board
func _ready():
	generate_tiles()
	generate_active_tiles()
	activate_tiles()
	generate_pieces()

#Populates the board with tiles
func generate_tiles() -> void:
	var count = 0
	for x in range(BOARD_DIMENSIONS.x):
		for y in range(BOARD_DIMENSIONS.y):
			var new_tile = load("res://Prefabs/BoardTile.tscn").instance()
			add_child(new_tile)
			new_tile.set_tile_pos(Vector2(x, y) * TILE_WIDTH)
			board_array[x].append(new_tile)
			count += 1
			
			
#Popilates board with "active" tiles - hardcoded in for each tile
func generate_active_tiles() -> void:
	
	#Break
	update_tile("BlueShipTile", Vector2(0,12), 0, 0)
	
	#Stage 1
	update_tile("YellowLaserTile", Vector2(1,12), 40000000, 1)
	update_tile("YellowShipTile", Vector2(2,12), 60000000, 2)
	update_tile("YellowShipTile", Vector2(3,12), 80000000, 2)
	update_tile("YellowShipTile", Vector2(4,12), 80000000, 2)
	update_tile("GreenShipTile", Vector2(5,12), 40000000, 1)
	update_tile("GreenShipTile", Vector2(6,12), 40000000, 1)
	
	#Break
	update_tile("BlueShipTile", Vector2(6,11), 0, 0)
	
	#Stage 2
	update_tile("BlueLaserTile", Vector2(7,11), 40000000, 1)
	update_tile("YellowLaserTile", Vector2(8,11), 40000000, 1)
	update_tile("YellowLaserTile", Vector2(9,11), 40000000, 1)
	update_tile("YellowShipTile", Vector2(10,11), 80000000, 2)
	update_tile("GreenShipTile", Vector2(11,11), 40000000, 1)
	update_tile("GreenShipTile", Vector2(12,11), 40000000, 1)
	
	#Break
	update_tile("BlueShipTile", Vector2(12,10), 0, 0)
	
	#Stage 3
	update_tile("BlueLaserTile", Vector2(12,9), 100000000, 1)
	update_tile("GreenLaserTile", Vector2(11,9), 100000000, 1)
	update_tile("YellowLaserTile", Vector2(10,9), 100000000, 1)
	update_tile("GreenShipTile", Vector2(9,9), 100000000, 1)
	update_tile("GreenShipTile", Vector2(8,9), 100000000, 1)
	update_tile("YellowLaserTile", Vector2(7,9), 100000000, 1)
	
	#Break
	update_tile("BlueShipTile", Vector2(5,9), 0, 0)
	
	#Stage 4
	update_tile("YellowShipTile", Vector2(4,9), 20000000, 1)
	update_tile("YellowShipTile", Vector2(3,9), 40000000, 2)
	update_tile("GreenShipTile", Vector2(2,9), 0, 0)
	update_tile("GreenShipTile", Vector2(1,9), 0, 0)
	update_tile("GreenShipTile", Vector2(1,8), 0, 0)
	update_tile("GreenShipTile", Vector2(1,7), 0, 0)
	
	#Break
	update_tile("BlueShipTile", Vector2(3,7),0,0)
	
	#Stage 5 - Phase 1: First in Human
	update_tile("PinkLaserTile", Vector2(4,7), 30000000, 1)
	update_tile("PinkLaserTile", Vector2(5,7), 30000000, 1)
	update_tile("YellowShipTile", Vector2(6,7), 40000000, 2)
	update_tile("YellowShipTile", Vector2(7,7), 40000000, 2)
	update_tile("GreenShipTile", Vector2(8,7), 30000000, 1)
	update_tile("GreenShipTile", Vector2(9,7), 30000000, 1)
	
	#Break
	update_tile("BlueShipTile", Vector2(11,6),0,0)
	
	#Stage 6 - Phase 2: Clinical Trials in Patients
	update_tile("GreenShipTile", Vector2(12,6), 50000000, 1)
	update_tile("GreenShipTile", Vector2(12,5), 50000000, 1)
	update_tile("YellowLaserTile", Vector2(12,4), 50000000, 3)
	update_tile("PinkLaserTile", Vector2(11,4), 50000000, 3)
	update_tile("PinkLaserTile", Vector2(10,4), 50000000, 3)
	update_tile("BlueLaserTile", Vector2(9,4), 50000000, 3)
	
	#Break
	update_tile("BlueShipTile", Vector2(7,4),0,0)
	
	#Stage 7 - Phase 3: Clinical Trials around the World
	update_tile("YellowShipTile", Vector2(6,4), 160000000, 2)
	update_tile("PinkLaserTile", Vector2(5,4), 160000000, 2)
	update_tile("PinkShipTile", Vector2(4,4), 160000000, 4)
	update_tile("YellowShipTile", Vector2(3,4), 160000000, 2)
	update_tile("YellowShipTile", Vector2(2,4), 160000000, 2)
	update_tile("GreenShipTile", Vector2(1,4), 160000000, 3)
	
	#Break
	update_tile("BlueShipTile", Vector2(1,2),0,0)
	
	#Stage 8 - File NDA for approval from FDA
	update_tile("GreenLaserTile", Vector2(1,1), 10000000, 1)
	update_tile("PinkLaserTile", Vector2(2,1), 0, 0)
	update_tile("GreenShipTile", Vector2(3,1), 10000000, 1)
	update_tile("GreenShipTile", Vector2(3,2), 10000000, 1)
	update_tile("GreenLaserTile", Vector2(4,2), 10000000, 1)
	update_tile("YellowLaserTile", Vector2(5,2), 10000000, 1)

	#Break
	update_tile("BlueShipTile", Vector2(6,0),0,0)
	
	#Stage 8 - File NDA for approval from FDA
	update_tile("PinkShipTile", Vector2(7,0),0,0)
	update_tile("PinkShipTile", Vector2(8,0),0,0)
	update_tile("YellowShipTile", Vector2(9,0),0,0)
	update_tile("YellowShipTile", Vector2(10,0),0,0)
	update_tile("GreenShipTile", Vector2(11,0),0,0)
	update_tile("GreenShipTile", Vector2(12,0),0,0)
	
	
#Helper function foor generate_active_tiles()
func update_tile(type: String, pos: Vector2, cost: int, time: int):
	var x = pos.x
	var y = pos.y
	var new_tile = load("res://Prefabs/" + type + ".tscn").instance()
	add_child(new_tile)
	new_tile.set_tile_pos(Vector2(x, y) * TILE_WIDTH)
	new_tile.set_properties(cost, time)
	board_array[x][y] = new_tile
	active_tiles.append(new_tile)
	

#activates the active tiles
func activate_tiles() -> void:
	for i in range(len(active_tiles)-1):
		active_tiles[i].set_next(active_tiles[i+1])
	
	
#Adds piece to starting location
func generate_pieces() -> void:
	var new_piece = load("res://Prefabs/Piece.tscn").instance()
	add_child(new_piece)
	get_tile_by_pos(Vector2(0, 12)).set_piece(new_piece)
			
	
func get_tile_by_pos(tile_pos: Vector2) -> BoardTile:
	return board_array[tile_pos.x][tile_pos.y]


#Moves piece to next tile
func move_piece(piece: Piece):
	var current_tile = piece.get_current_tile()
	var destination = current_tile.get_next()
	destination.set_piece(piece)
	piece.emit_signal("leaving_tile")
	
	
