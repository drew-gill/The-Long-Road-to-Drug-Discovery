extends Control

func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Instructions.tscn")

func _on_NewGame_pressed():
	get_tree().change_scene("res://Scenes/Choose_NumPlayers.tscn")
