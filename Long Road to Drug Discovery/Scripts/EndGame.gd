extends Node2D

func _on_player_finished():
	if GlobalVar.num_players == GlobalVar.allplayersfinished:
		var scores = {}
		for i in range(GlobalVar.num_players):
			var player = get_node("/root/GameBoard/Player" + str(i + 1))
			scores[player.getFinalScore()] = "Player" + str(i + 1)
		var scoreboard = scores.keys().sort()
		if GlobalVar.num_players == 1:
			var player1 = get_node("/root/GameBoard/Player1")
			$Winner/PlayerWins.text = "Player 1 WINS"
			$Winner/LivesSaved.text = player1.getDrugName() + " saved " + str(player1.getLivesSaved) + " lives!"
			$Winner/Profit.text = player1.getDrugName() + " made $" + str(player1.getProfitPerYear() * player1.getPlayerYears()) + " in profit!"
			$ScoreBoard/Player1.text = "1. " + player1.getDrugName() + " saved " + str(player1.getLivesSaved) + " lives! and made $" + str(player1.getProfitPerYear() * player1.getPlayerYears()) + " in profit!"
		else:
			for i in range(len(scoreboard)):
				var player = scores[scoreboard[i]]
				var player_node = get_node("/root/GameBoard/" + player)
				if i == 0:
					$Winner/PlayerWins.text = player + " WINS"
					$Winner/LivesSaved.text = player_node.getDrugName() + " saved " + str(player_node.getLivesSaved) + " lives!"
					$Winner/Profit.text = player_node.getDrugName() + " made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
					$ScoreBoard/Player1.text = "1. " + player_node.getDrugName() + " saved " + str(player_node.getLivesSaved) + " lives! and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
				elif i == 1:
					$ScoreBoard/Player2.text = "2. " + player_node.getDrugName() + " saved " + str(player_node.getLivesSaved) + " lives! and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
					$ScoreBoard/Player2.show()
				elif i == 2:
					$ScoreBoard/Player3.text = "3. " + player_node.getDrugName() + " saved " + str(player_node.getLivesSaved) + " lives! and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
					$ScoreBoard/Player3.show()
				else:
					$ScoreBoard/Player4.text = "4. " + player_node.getDrugName() + " saved " + str(player_node.getLivesSaved) + " lives! and made $" + str(player_node.getProfitPerYear() * player_node.getPlayerYears()) + " in profit!"
					$ScoreBoard/Player4.show()
