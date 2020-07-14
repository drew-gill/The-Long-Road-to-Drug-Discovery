extends Control

func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/StartupSequence/Instructions.tscn")

func _on_NewGame_pressed():
	get_tree().change_scene("res://Scenes/StartupSequence/Choose_NumPlayers.tscn")
