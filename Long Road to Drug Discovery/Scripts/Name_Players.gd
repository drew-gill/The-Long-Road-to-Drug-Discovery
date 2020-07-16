extends Control

export (NodePath) var dropdown1_path
export (NodePath) var dropdown2_path
export (NodePath) var dropdown3_path
export (NodePath) var dropdown4_path
onready var dropdown1 = get_node(dropdown1_path)
onready var dropdown2 = get_node(dropdown2_path)
onready var dropdown3 = get_node(dropdown3_path)
onready var dropdown4 = get_node(dropdown4_path)

func _ready():
	add_items()
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

func _on_DrugName4_text_changed():
	var label = get_node("Player4/Player4_Icon/Label")
	var edit = get_node("Player4/DrugName4/DrugName4")
	label.set_text(edit.get_text())
	GlobalVar.DrugName4 = edit.get_text()

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/StartupSequence/Choose_NumPlayers.tscn")

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Main Scene.tscn")
	
func add_items():
	$Player1/Disease1/Disease1.theme = Theme.new()
	$Player1/Disease1/Disease1.theme.default_font = load("res://fonts/FSAlbert_25.tres")
	$Player2/Disease2/Disease2.theme = Theme.new()
	$Player2/Disease2/Disease2.theme.default_font = load("res://fonts/FSAlbert_25.tres")
	$Player3/Disease3/Disease3.theme = Theme.new()
	$Player3/Disease3/Disease3.theme.default_font = load("res://fonts/FSAlbert_25.tres")
	$Player4/Disease4/Disease4.theme = Theme.new()
	$Player4/Disease4/Disease4.theme.default_font = load("res://fonts/FSAlbert_25.tres")
	dropdown1.add_item("Breast Cancer")
	dropdown1.add_item("Covid-19")
	dropdown1.add_item("Alzheimer's")
	dropdown2.add_item("Breast Cancer")
	dropdown2.add_item("Covid-19")
	dropdown2.add_item("Alzheimer's")
	dropdown3.add_item("Breast Cancer")
	dropdown3.add_item("Covid-19")
	dropdown3.add_item("Alzheimer's")
	dropdown4.add_item("Breast Cancer")
	dropdown4.add_item("Covid-19")
	dropdown4.add_item("Alzheimer's")

func _on_Disease1_item_selected(index):
	GlobalVar.Disease1 = dropdown1.get_item_text(index)
	if index == 0:
		GlobalVar.Budget1 = 5000000000
		GlobalVar.Time1 = 30
	elif index == 1:
		GlobalVar.Budget1 = 3000000000
		GlobalVar.Time1 = 10
	elif index == 2:
		GlobalVar.Budget1 = 4000000000
		GlobalVar.Time1 = 20

func _on_Disease2_item_selected(index):
	GlobalVar.Disease2 = dropdown2.get_item_text(index)
	if index == 0:
		GlobalVar.Budget2 = 5000000000
		GlobalVar.Time2 = 30
	elif index == 1:
		GlobalVar.Budget2 = 3000000000
		GlobalVar.Time2 = 15
	elif index == 2:
		GlobalVar.Budget2 = 4000000000
		GlobalVar.Time2 = 20

func _on_Disease3_item_selected(index):
	GlobalVar.Disease3 = dropdown3.get_item_text(index)
	if index == 0:
		GlobalVar.Budget3 = 5000000000
		GlobalVar.Time3 = 30
	elif index == 1:
		GlobalVar.Budget3 = 3000000000
		GlobalVar.Time3 = 15
	elif index == 2:
		GlobalVar.Budget3 = 4000000000
		GlobalVar.Time3 = 20

func _on_Disease4_item_selected(index):
	GlobalVar.Disease4 = dropdown4.get_item_text(index)
	if index == 0:
		GlobalVar.Budget4 = 5000000000
		GlobalVar.Time4 = 30
	elif index == 1:
		GlobalVar.Budget4 = 3000000000
		GlobalVar.Time4 = 15
	elif index == 2:
		GlobalVar.Budget4 = 4000000000
		GlobalVar.Time4 = 20
