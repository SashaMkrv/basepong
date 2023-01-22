extends Node
class_name BasicGoalProvider

@export
var home_player : PlayerData
@export
var visiting_player : PlayerData

func give_player_goal(player : PlayerData):
	player.score += 1

func goal_scored_on(goal_key : String):
	print_debug("Trying to give goal to %s", goal_key)
	match(goal_key):
		"visiting":
			give_goal_to(home_player)
		"home":
			give_goal_to(visiting_player)

func give_goal_to(player : PlayerData):
	give_player_goal(player)
