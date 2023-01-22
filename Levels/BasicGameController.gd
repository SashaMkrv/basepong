extends Node
class_name BasicGameController

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
	RESETTING,
	PLAYING
}
var current_state = STATES.WAITING

var next_towards_is_left : bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	signalHelper.goal_for_key.connect(goal_scored_on)
	game_reset.reset_complete.connect(reset_complete)


func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		start()


func goal_scored_on(goal_key : String):
	if goalGiver:
		goalGiver.goal_scored_on(goal_key)
	reset()


func start() -> void:
	if !request_state(STATES.PLAYING):
		return
	current_state = STATES.PLAYING
	var towards = Vector2.LEFT if next_towards_is_left else Vector2.RIGHT
	game_start.start(towards)

func reset():
	if !request_state(STATES.RESETTING):
		return
	current_state = STATES.RESETTING
	next_towards_is_left = !next_towards_is_left
	game_reset.reset()


func reset_complete():
	if !request_state(STATES.WAITING):
		return
	current_state = STATES.WAITING

func request_state(state : STATES) -> bool :
	match(state):
		STATES.PLAYING:
			return current_state == STATES.WAITING
		STATES.WAITING:
			return current_state == STATES.RESETTING
		STATES.RESETTING:
			return current_state == STATES.PLAYING
	return false
