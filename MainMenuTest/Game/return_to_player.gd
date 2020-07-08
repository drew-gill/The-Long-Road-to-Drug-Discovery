extends Control

func _ready():
	if GlobalVar.num_players == 1:
		$Player1.show()
	elif GlobalVar.num_players == 2:
		$Player2.show()

func _on_BackButton_pressed():
	get_tree().change_scene("res://Game/Player.tscn")

func _on_DrugNameForm_text_changed():
	var label = get_node("Player1/Player1_Icon/Label")
	var edit = get_node("Player1/DrugName/DrugNameForm")
	label.set_text(edit.get_text())

func _on_Player1_Button_pressed():
	$Player1/Disease/Label.show()
	$Player1/Disease/DiseaseForm.show()
	$Player1/DrugName/Label.show()
	$Player1/DrugName/DrugNameForm.show()


func _on_Button1_pressed():
	$Player2/Disease1.show()
	$Player2/DrugName1.show()
	$Player2/Disease2.hide()
	$Player2/DrugName2.hide()

func _on_Button2_pressed():
	$Player2/Disease1.hide()
	$Player2/DrugName1.hide()
	$Player2/Disease2.show()
	$Player2/DrugName2.show()

func _on_TextEdit1_text_changed():
	var label = get_node("Player2/Player2_Lineup/Player1_Icon/Label")
	var edit = get_node("Player2/DrugName1/TextEdit")
	label.set_text(edit.get_text())


func _on_TextEdit2_text_changed():
	var label = get_node("Player2/Player2_Lineup/Player2_Icon/Label")
	var edit = get_node("Player2/DrugName2/TextEdit")
	label.set_text(edit.get_text())
