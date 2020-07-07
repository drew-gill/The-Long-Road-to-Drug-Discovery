extends Node

export var numOfPlayers = 1
#up to player 4, if there are 4 total players
var currentPlayer = 1 



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
	

func endTurn():
	if(currentPlayer + 1 > numOfPlayers):
		currentPlayer = 1
	else:
		currentPlayer += 1

func _process(delta):
	$Money.text = "Money: $" + addCommas(money)
	$Years.text = "Years left: " + str(years)
	$BackupFormulations.text = "Backup Formulations: " + str(backups)
