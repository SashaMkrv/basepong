extends Node
class_name BasicGameController

@export
var home_player : PlayerData
@export
var visiting_player : PlayerData

@export
var signalHelper : SignalHelper

@export
var goalGiver : BasicGoalProvider


# Called when the node enters the scene tree for the first time.
func _ready():
	signalHelper.goal_for_key.connect(goal_scored_on)


func goal_scored_on(goal_key : String):
	match(goal_key):
		"visiting":
			give_goal_to(home_player)
		"home":
			give_goal_to(visiting_player)


func give_goal_to(player : PlayerData):
	goalGiver.give_player_goal(player)
