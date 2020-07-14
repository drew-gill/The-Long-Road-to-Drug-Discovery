extends Node2D
class_name Piece

#piece properties
export var money = 1000000
export var years = 20
export var backups = 0

#Signals
signal leaving_tile

#access the board itself
onready var board = get_node("/root/Node2D")

func _ready():
	pass

#get the tile that the piece is currently on
func get_current_tile()-> BoardTile:
	#CHANGE DENOMINATOR TO SIZE OF SQUARE
	var tile_position = position/board.TILE_WIDTH
	tile_position.x = int(tile_position.x)
	tile_position.y = int(tile_position.y)
	return board.get_tile_by_pos(tile_position)

	
func getPlayerMoney():
	return money

func getPlayerYears():
	return years
	
func getPlayerBackups():
	return backups

func alterPlayerMoney(changeValue):
	money += changeValue

func alterPlayerYears(changeValue):
	years += changeValue
	
func alterPlayerBackups(changeValue):
	backups += changeValue
#When the piece is clicked:

func _on_Button_pressed():
	print("Money Spent: $" + str(money))
	board.move_piece(self)
