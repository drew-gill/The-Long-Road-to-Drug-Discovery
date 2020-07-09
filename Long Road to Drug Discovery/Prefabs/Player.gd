extends KinematicBody2D

export var money = 1000000
export var years = 20
export var backups = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body
	
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
