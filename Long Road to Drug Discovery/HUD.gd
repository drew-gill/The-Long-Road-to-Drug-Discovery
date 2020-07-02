extends Node

export var money = 1000000
export var years = 20
export var backups = 0

func _ready():
	$Start.show()
	$AddYear.hide()
	$AddMoney.hide()
	$SubtractMoney.hide()
	$SubtractYear.hide()
	$Money.hide()
	$Years.hide()
	$BackupFormulations.hide()
	
	

func _on_Start_pressed():
	$Start.hide()
	$AddYear.show()
	$AddMoney.show()
	$SubtractMoney.show()
	$SubtractYear.show()
	$Money.show()
	$Years.show()
	$BackupFormulations.show()
	

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

func _process(delta):
	$Money.text = "Money: " + addCommas(money)
	$Years.text = "Years left: " + str(years)
	$BackupFormulations.text = "Backup Formulations: " + str(backups)
