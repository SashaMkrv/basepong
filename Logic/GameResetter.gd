extends Node
class_name BasicGameResetter

@export
var ball : Node2D

var should_reset : bool = false
var reset_ball_position : Vector2

func _ready():
	reset_ball_position = ball.position

func reset():
	ball.should_reset()
