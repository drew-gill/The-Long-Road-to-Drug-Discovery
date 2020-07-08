extends Control

#export var players = GlobalVar.num_players

func _ready():
	$Player2.hide()
	$Player3.hide()
	$Player.show()

func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Game/Game.tscn")

func _on_MinusPlayer_pressed():
	GlobalVar.num_players -= 1
	if GlobalVar.num_players < 0:
		GlobalVar.num_players = 0
	if GlobalVar.num_players == 0:
		$Player.hide()
	elif GlobalVar.num_players == 1:
		$Player2.hide()
		$Player.show()
	elif GlobalVar.num_players == 2:
		$Player2.show()
		$Player3.hide()
	elif GlobalVar.num_players == 3:
		$Player4.hide()
		$Player3.show()
	elif GlobalVar.num_players == 4:
		$Player5.hide()
		$Player4.show()
	elif GlobalVar.num_players == 5:
		$Player6.hide()
		$Player5.show()
	elif GlobalVar.num_players == 6:
		$Player7.hide()
		$Player6.show()

func _on_PlusPlayer_pressed():
	GlobalVar.num_players += 1
	if GlobalVar.num_players > 7:
		GlobalVar.num_players = 7
	if GlobalVar.num_players == 1:
		$Player.show()
	elif GlobalVar.num_players == 2:
		$Player2.show()
		$Player.hide()
	elif GlobalVar.num_players == 3:
		$Player2.hide()
		$Player3.show()
	elif GlobalVar.num_players == 4:
		$Player4.show()
		$Player3.hide()
	elif GlobalVar.num_players == 5:
		$Player5.show()
		$Player4.hide()
	elif GlobalVar.num_players == 6:
		$Player6.show()
		$Player5.hide()
	elif GlobalVar.num_players == 7:
		$Player7.show()
		$Player6.hide()

func _process(delta):
	$HBoxContainer/Players.text = str(GlobalVar.num_players)
