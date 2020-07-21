extends Camera2D

#the camera should be a sibling of the level objects, with a child HUD 2D node

#the level to focus on, whether it is where the current player is or selected.
var levelFocus

#set camera's Offset property to match.

func _ready():
	SetActiveLevelNumber(1)
	_moveCamera()

func SetActiveLevelNumber(levelNumber):
	levelFocus = get_node("../Level" + str(levelNumber))
	_moveCamera()

func SetActiveLevelPath(nodePath):
	levelFocus = get_node(nodePath).get_position_in_parent()
	_moveCamera()

func _moveCamera():
	self.position = levelFocus.get_position()
