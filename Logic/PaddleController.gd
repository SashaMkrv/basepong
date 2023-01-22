extends Node
class_name PaddleController

@export
var paddle : Paddle
@export
var ball : Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	paddle.move_toward(ball.global_position)
