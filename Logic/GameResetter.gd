extends Node
class_name BasicGameResetter

@export
var ball : Ball

var should_reset : bool = false
var reset_ball_position : Vector2

signal reset_complete()

func _ready():
	reset_ball_position = ball.position
	ball.complete_reset.connect(complete)


func reset():
	ball.should_reset()


func complete():
	reset_complete.emit()
