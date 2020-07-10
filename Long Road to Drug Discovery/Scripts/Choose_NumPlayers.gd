extends Control

func _ready():
	if GlobalVar.num_players == 1:
		$Players/Player1.rect_position = Vector2( ($Control.get_size().x / 2) - ($Players/Player1.get_size().x / 2), $Control.rect_position.y + 100)
		$Players/Player1.show()
	elif GlobalVar.num_players == 2:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 8) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 8) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
	elif GlobalVar.num_players == 3:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 11) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 11) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 11) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
	elif GlobalVar.num_players == 4:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 14) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 14) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 14) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player4.rect_position = Vector2( (12 * $Control.get_size().x / 14) - $Players/Player4.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
		$Players/Player4.show()

func _on_MinusPlayer_pressed():
	GlobalVar.num_players -= 1
	if GlobalVar.num_players < 1:
		GlobalVar.num_players = 1
	if GlobalVar.num_players == 1:
		$Players/Player1.rect_position = Vector2( ($Control.get_size().x / 2) - ($Players/Player1.get_size().x / 2), $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.hide()
		$Players/Player3.hide()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 2:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 8) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 8) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.hide()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 3:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 11) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 11) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 11) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 4:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 14) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 14) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 14) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player4.rect_position = Vector2( (12 * $Control.get_size().x / 14) - $Players/Player4.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
		$Players/Player4.show()

func _on_AddPlayer_pressed():
	GlobalVar.num_players += 1
	if GlobalVar.num_players > 4:
		GlobalVar.num_players = 4
	if GlobalVar.num_players == 1:
		$Players/Player1.rect_position = Vector2( ($Control.get_size().x / 2) - ($Players/Player1.get_size().x / 2), $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.hide()
		$Players/Player3.hide()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 2:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 8) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 8) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.hide()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 3:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 11) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 11) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 11) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
		$Players/Player4.hide()
	elif GlobalVar.num_players == 4:
		$Players/Player1.rect_position = Vector2( (3 * $Control.get_size().x / 14) - $Players/Player1.get_size().x, $Control.rect_position.y + 100)
		$Players/Player2.rect_position = Vector2( (6 * $Control.get_size().x / 14) - $Players/Player2.get_size().x, $Control.rect_position.y + 100)
		$Players/Player3.rect_position = Vector2( (9 * $Control.get_size().x / 14) - $Players/Player3.get_size().x, $Control.rect_position.y + 100)
		$Players/Player4.rect_position = Vector2( (12 * $Control.get_size().x / 14) - $Players/Player4.get_size().x, $Control.rect_position.y + 100)
		$Players/Player1.show()
		$Players/Player2.show()
		$Players/Player3.show()
		$Players/Player4.show()

func _process(delta):
	$Control/NumPlayers.text = str(GlobalVar.num_players)

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")

func _on_ContinueButton_pressed():
	
	get_tree().change_scene("res://Scenes/Name_Players.tscn")
