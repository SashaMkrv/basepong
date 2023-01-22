extends Node
class_name PaddleController

@export
var paddle : Paddle
@export
var ball : Node2D


func _physics_process(_delta):
	paddle.move_toward(ball.global_position)
