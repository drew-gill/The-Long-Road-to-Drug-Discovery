extends Node
class_name HUD2

export (NodePath) var playerTrackerPath
var currentPlayer
var playerTracker

signal beginMoving
signal transfer_phaseandroll

func _ready():
	_showAll(true)
	$Start.hide()
	playerTracker = get_node(playerTrackerPath)
	randomize() #used to reset seed for dice roll
	
	

func _on_Start_pressed():
	_showAll(true)
	$Start.hide()
		
		
func _showAll(boolean):
	if(boolean == true):
		$Start.show()
		$VBoxContainer.show()
		$Money.show()
		$Years.show()
		$BackupFormulations.show()
		$DialogueBox.show()

	else:
		$Start.hide()
		$VBoxContainer.hide()
		$Money.hide()
		$Years.hide()
		$BackupFormulations.hide()
		$DialogueBox.hide()
	#always hide the warning, only want this when specifically called.
	$Warning.hide()
	
func _showWarning(text):
	$Warning.text = text
	$Warning.show()

func _on_EndTurn_pressed():
	playerTracker.endTurn()
	

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
	currentPlayer = playerTracker.getCurrentPlayerNode()
	if(currentPlayer != null):
		$VBoxContainer/Money.text = "Money: $" + addCommas(currentPlayer.getPlayerMoney())
		$VBoxContainer/Years.text = "Years left: " + str(currentPlayer.getPlayerYears())
		$VBoxContainer/BackupFormulations.text = "Backup Formulations: " + str(currentPlayer.getPlayerBackups())
		$PlayerTurn.text = "Player " + str(currentPlayer.getPlayerNumber()) +"'s Turn!"
		if(currentPlayer.getCurrentTile() < 1):
			$LevelText.text = "Level: " + str(currentPlayer.getCurrentLevel()) + "\n Please roll the dice!"
		else:
			$LevelText.text = "Level: " + str(currentPlayer.getCurrentLevel()) + "\n Roll: " + str(currentPlayer.getCurrentTile())
		
		if(playerTracker.getCurrentTurnSequence() != "Roll"):
			$RollDice.hide()
		else:
			$RollDice.show()
		
		if(playerTracker.getCurrentTurnSequence() == "Dialogue" or playerTracker.getCurrentTurnSequence() == "Confirm"):
			$DialogueBox.show()
		else:
			$DialogueBox.hide()
		
		
		if(playerTracker.getCurrentTurnSequence() != "Confirm"):
			$EndTurn.hide()
		else:
			$EndTurn.show()
		
	else:
		_showAll(false)
		_showWarning("Warning! No players found in the scene.")




func _on_RollDice_pressed():
	var roll = randi()%6 + 1
	currentPlayer.setCurrentTile(roll)
	connect("transfer_phaseandroll", get_node("DialogueBox/Dialogue"), "_on_transfer_phaseandroll")
	emit_signal("transfer_phaseandroll", int(currentPlayer.getCurrentLevel()), int(currentPlayer.getCurrentTile()))
	playerTracker.nextInTurnSequence()
	



#Change the active level of the parent camera object
func _on_OptionButton_item_selected(id):
	if(id == 0):
		id = currentPlayer.getCurrentLevel()
	get_parent().SetActiveLevelNumber(id)


func _on_MoreInfo_pressed():
	var infoLevels = ["https://www.pfizer.com/health-wellness/healthy-living/brain-nervous-system",
			"https://www.pfizer.com/health-wellness/healthy-living/heart-cardiovascular",
			"https://www.pfizer.com/health-wellness/healthy-living/cold-and-flu",
			"https://www.pfizer.com/health-wellness/healthy-living/digestive",
			"https://www.pfizer.com/health-wellness/healthy-living/healthy-aging",
			"https://www.pfizer.com/health-wellness/healthy-living/quit-smoking",
			"https://www.pfizer.com/health-wellness/healthy-living/mens-health",
			"https://www.pfizer.com/health-wellness/healthy-living/mental-health",
			"https://www.pfizer.com/health-wellness/healthy-living/diet-exercise"]
	OS.shell_open(infoLevels[currentPlayer.getCurrentLevel() - 1])
