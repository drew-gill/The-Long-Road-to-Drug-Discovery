extends Node

export var numOfPlayers = 1
#up to player 4, if there are 4 total players
var currentPlayer = 1 



func _ready():
	_showAll(false)
	$Start.show()
	
	

func _on_Start_pressed():
	_showAll(true)
	$Start.hide()
	

func _showAll(boolean):
	if(boolean == true):
		$Start.show()
		$AddYear.show()
		$AddMoney.show()
		$SubtractMoney.show()
		$SubtractYear.show()
		$Money.show()
		$Years.show()
		$BackupFormulations.show()
		$TextBox.show()

	else:
		$Start.hide()
		$AddYear.hide()
		$AddMoney.hide()
		$SubtractMoney.hide()
		$SubtractYear.hide()
		$Money.hide()
		$Years.hide()
		$BackupFormulations.hide()
		$TextBox.hide()

	
	#always hide the warning, only want this when specifically called.
	$Warning.hide()
	
func _showWarning(text):
	$Warning.text = text
	$Warning.show()

func endTurn():
	if(currentPlayer + 1 > numOfPlayers):
		currentPlayer = 1
	else:
		currentPlayer += 1

func _on_AddMoney_pressed():
	$"../Player".alterPlayerMoney(1000)

func _on_SubtractMoney_pressed():
	$"../Player".alterPlayerMoney(-1000)


func _on_AddYear_pressed():
	$"../Player".alterPlayerYears(1)


func _on_SubtractYear_pressed():
	$"../Player".alterPlayerYears(-1)

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
	if($"../Player" != null):
		$Money.text = "Money: $" + addCommas($"../Player".getPlayerMoney())
		$Years.text = "Years left: " + str($"../Player".getPlayerYears())
		$BackupFormulations.text = "Backup Formulations: " + str($"../Player".getPlayerBackups())
	else:
		_showAll(false)
		_showWarning("Warning! No players found in the scene.")
