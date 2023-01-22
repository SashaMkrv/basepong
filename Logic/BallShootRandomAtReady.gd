extends Node

@export
var ball: Ball

func _ready():
	ball.apply_bounce_impulse(Vector2.UP.rotated(randf() * PI * 2))
