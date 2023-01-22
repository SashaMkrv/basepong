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
@export
var game_reset : BasicGameResetter
@export
var game_start : GameStarter


enum STATES {
	WAITING,
	PLAYING
}
var current_state = STATES.WAITING

var next_towards_is_left : bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	signalHelper.goal_for_key.connect(goal_scored_on)


func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		start()


func goal_scored_on(goal_key : String):
	print_debug("Trying to give goal to %s", goal_key)
	match(goal_key):
		"visiting":
			give_goal_to(home_player)
		"home":
			give_goal_to(visiting_player)
	reset()

func give_goal_to(player : PlayerData):
	goalGiver.give_player_goal(player)

func start() -> void:
	if current_state == STATES.PLAYING:
		return
	current_state = STATES.PLAYING
	var towards = Vector2.LEFT if next_towards_is_left else Vector2.RIGHT
	game_start.start(towards)

func reset():
	if current_state == STATES.WAITING:
		return
	current_state = STATES.WAITING
	next_towards_is_left = !next_towards_is_left
	game_reset.reset()
