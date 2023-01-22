extends Node
class_name GameStarter

@export
var ball : Ball

func start(towards: Vector2):
	ball.apply_bounce_impulse(towards.normalized())
