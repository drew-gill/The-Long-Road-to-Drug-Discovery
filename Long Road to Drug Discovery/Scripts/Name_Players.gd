extends Control

func _ready():
	if GlobalVar.num_players == 1:
		$Player1/Player1_Icon.rect_position = Vector2(($Player1/Disease1.get_size().x / 2) - ($Player1/Player1_Icon.get_size().x / 2), 0)
		$Player1.show()
	elif GlobalVar.num_players == 2:
		$Player1/Player1_Icon.rect_position = Vector2((3 * ($Player1/Disease1.get_size().x / 8)) - $Player1/Player1_Icon.get_size().x, 0)
		$Player2/Player2_Icon.rect_position = Vector2((6 * ($Player2/Disease2.get_size().x / 8)) - $Player2/Player2_Icon.get_size().x, 0)
		$Player1.show()
		$Player2.show()
	elif GlobalVar.num_players == 3:
		$Player1/Player1_Icon.rect_position = Vector2((3 * ($Player1/Disease1.get_size().x / 11)) - $Player1/Player1_Icon.get_size().x, 0)
		$Player2/Player2_Icon.rect_position = Vector2((6 * ($Player2/Disease2.get_size().x / 11)) - $Player2/Player2_Icon.get_size().x, 0)
		$Player3/Player3_Icon.rect_position = Vector2((9 * ($Player3/Disease3.get_size().x / 11)) - $Player3/Player3_Icon.get_size().x, 0)
		$Player1.show()
		$Player2.show()
		$Player3.show()
	elif GlobalVar.num_players == 4:
		$Player1/Player1_Icon.rect_position = Vector2((3 * ($Player1/Disease1.get_size().x / 14)) - $Player1/Player1_Icon.get_size().x, 0)
		$Player2/Player2_Icon.rect_position = Vector2((6 * ($Player2/Disease2.get_size().x / 14)) - $Player2/Player2_Icon.get_size().x, 0)
		$Player3/Player3_Icon.rect_position = Vector2((9 * ($Player3/Disease3.get_size().x / 14)) - $Player3/Player3_Icon.get_size().x, 0)
		$Player4/Player4_Icon.rect_position = Vector2((12 * ($Player4/Disease4.get_size().x / 14)) - $Player4/Player4_Icon.get_size().x, 0)
		$Player1.show()
		$Player2.show()
		$Player3.show()
		$Player4.show()
		

func _on_Player1_Button_pressed():
	$Player1/Disease1.show()
	$Player1/DrugName1.show()
	$Player2/Disease2.hide()
	$Player2/DrugName2.hide()
	$Player3/Disease3.hide()
	$Player3/DrugName3.hide()
	$Player4/Disease4.hide()
	$Player4/DrugName4.hide()

func _on_Disease1_text_changed():
	var edit = get_node("Player1/Disease1/Disease1")
	GlobalVar.Disease1 = edit.get_text()

func _on_DrugName1_text_changed():
	var label = get_node("Player1/Player1_Icon/Label")
	var edit = get_node("Player1/DrugName1/DrugName1")
	label.set_text(edit.get_text())
	GlobalVar.DrugName1 = edit.get_text()

func _on_Player2_Button_pressed():
	$Player1/Disease1.hide()
	$Player1/DrugName1.hide()
	$Player2/Disease2.show()
	$Player2/DrugName2.show()
	$Player3/Disease3.hide()
	$Player3/DrugName3.hide()
	$Player4/Disease4.hide()
	$Player4/DrugName4.hide()

func _on_Disease2_text_changed():
	var edit = get_node("Player2/Disease2/Disease2")
	GlobalVar.Disease2 = edit.get_text()

func _on_DrugName2_text_changed():
	var label = get_node("Player2/Player2_Icon/Label")
	var edit = get_node("Player2/DrugName2/DrugName2")
	label.set_text(edit.get_text())
	GlobalVar.DrugName2 = edit.get_text()

func _on_Player3_Button_pressed():
	$Player1/Disease1.hide()
	$Player1/DrugName1.hide()
	$Player2/Disease2.hide()
	$Player2/DrugName2.hide()
	$Player3/Disease3.show()
	$Player3/DrugName3.show()
	$Player4/Disease4.hide()
	$Player4/DrugName4.hide()

func _on_Disease3_text_changed():
	var edit = get_node("Player3/Disease3/Disease3")
	GlobalVar.Disease3 = edit.get_text()

func _on_DrugName3_text_changed():
	var label = get_node("Player3/Player3_Icon/Label")
	var edit = get_node("Player3/DrugName3/DrugName3")
	label.set_text(edit.get_text())
	GlobalVar.DrugName3 = edit.get_text()


func _on_Player4_Button_pressed():
	$Player1/Disease1.hide()
	$Player1/DrugName1.hide()
	$Player2/Disease2.hide()
	$Player2/DrugName2.hide()
	$Player3/Disease3.hide()
	$Player3/DrugName3.hide()
	$Player4/Disease4.show()
	$Player4/DrugName4.show()

func _on_Disease4_text_changed():
	var edit = get_node("Player4/Disease4/Disease4")
	GlobalVar.Disease4 = edit.get_text()

func _on_DrugName4_text_changed():
	var label = get_node("Player4/Player4_Icon/Label")
	var edit = get_node("Player4/DrugName4/DrugName4")
	label.set_text(edit.get_text())
	GlobalVar.DrugName4 = edit.get_text()

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/StartupSequence/Choose_NumPlayers.tscn")

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Main Scene.tscn")
