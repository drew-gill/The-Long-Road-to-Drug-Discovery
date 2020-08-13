extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_pieces()
	$Winner.hide()
	$ScoreBoard.hide()



func generate_pieces() -> void:
	for i in range(GlobalVar.num_players):
		var new_piece = load("res://Prefabs/Player.tscn").instance()
		new_piece.setPlayerNumber(GlobalVar.num_players - i)
		add_child(new_piece)
		new_piece.set_name("Player" + str(GlobalVar.num_players - i))
		var starting = get_node("Level1/StartingTile")
		starting.set_piece(new_piece)
		
		if(GlobalVar.fastMode):
			new_piece.setPlayerSpeed(500)
		else:
			new_piece.setPlayerSpeed(125)
		
		if GlobalVar.num_players - i == 1:
			new_piece.setPlayerMoney(GlobalVar.Budget1)
			new_piece.setPlayerYears(GlobalVar.Time1)
			new_piece.setPlayerDisease(GlobalVar.Disease1)
			new_piece.setPlayerDrugName(GlobalVar.DrugName1)
		elif GlobalVar.num_players - i == 2:
			new_piece.setPlayerMoney(GlobalVar.Budget2)
			new_piece.setPlayerYears(GlobalVar.Time2)
			new_piece.setPlayerDisease(GlobalVar.Disease2)
			new_piece.setPlayerDrugName(GlobalVar.DrugName2)
		elif GlobalVar.num_players - i == 3:
			new_piece.setPlayerMoney(GlobalVar.Budget3)
			new_piece.setPlayerYears(GlobalVar.Time3)
			new_piece.setPlayerDisease(GlobalVar.Disease3)
			new_piece.setPlayerDrugName(GlobalVar.DrugName3)
		elif GlobalVar.num_players - i == 4:
			new_piece.setPlayerMoney(GlobalVar.Budget4)
			new_piece.setPlayerYears(GlobalVar.Time4)
			new_piece.setPlayerDisease(GlobalVar.Disease4)
			new_piece.setPlayerDrugName(GlobalVar.DrugName4)


func allPlayersFinished():
	$Winner.show()
	$ScoreBoard.show()	
	
	var scores = []
	for i in range(GlobalVar.num_players):
		var player = get_node("/root/GameBoard/Player" + str(i + 1))
		scores.append(player.getFinalScore())
	
	var scoresUnsorted = scores.duplicate()
	scores.sort()
	scores.invert()
	
	var playerPositions = []
	
	for i in range(GlobalVar.num_players):
		for j in range(len(scoresUnsorted)):
			if(scores[i] == scoresUnsorted[j]):
				playerPositions.append(j+1)
				break
	
	for i in range(GlobalVar.num_players):
		var player = playerPositions[i]
		var player_node = get_node("/root/GameBoard/Player" + str(player))
		if i == 0:
			get_node("Winner/PlayerWins").text = "Player " + str(player) + " WINS"
			get_node("Winner/LivesSaved").text = player_node.getPlayerDrugName() + " saved " + str(player_node.getLivesSaved()) + " lives!"
			get_node("Winner/Profit").text = player_node.getPlayerDrugName() + " made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
			get_node("ScoreBoard/Player1").text = "First: " + player_node.getPlayerDrugName() + " saved " + str(player_node.getLivesSaved()) + " lives and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
		elif i == 1:
			get_node("ScoreBoard/Player2").text = "Second: " + player_node.getPlayerDrugName() + " saved " + str(player_node.getLivesSaved()) + " lives and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
			get_node("ScoreBoard/Player2").show()
		elif i == 2:
			get_node("ScoreBoard/Player3").text = "Third: " + player_node.getPlayerDrugName() + " saved " + str(player_node.getLivesSaved()) + " lives and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
			get_node("ScoreBoard/Player3").show()
		else:
			get_node("ScoreBoard/Player4").text = "Fourth: " + player_node.getPlayerDrugName() + " saved " + str(player_node.getLivesSaved()) + " lives and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
			get_node("ScoreBoard/Player4").show()
