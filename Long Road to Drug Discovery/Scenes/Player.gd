extends KinematicBody2D

export var money = 1000000
export var years = 20
export var backups = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body
	
	
	
func _on_AddMoney_pressed():
	money += 1000

func _on_SubtractMoney_pressed():
	money -= 1000


func _on_AddYear_pressed():
	years += 1


func _on_SubtractYear_pressed():
	years -= 1

func addCommas(value):
	var string = str(value)
	var mod = string.length() % 3
	var res = ""

	for i in range(0, string.length()):
		if i != 0 && i % 3 == mod:
			res += ","
		res += string[i]

	return res
