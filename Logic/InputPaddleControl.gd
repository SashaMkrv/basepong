extends Node
class_name InputPaddleController

@export
var paddle : Paddle

func _unhandled_input(event: InputEvent):
	var direction = Vector2.DOWN * event.get_action_strength("move_down") + Vector2.UP * event.get_action_strength("move_up") + Vector2.RIGHT * event.get_action_strength("move_right") + Vector2.LEFT * event.get_action_strength("move_left")
#	paddle.move_toward_local(direction)


func _physics_process(delta):
	var vec = dir_vec("move_down", Vector2.DOWN)
	vec += dir_vec("move_up", Vector2.UP)
	vec += dir_vec("move_right", Vector2.RIGHT)
	vec += dir_vec("move_left", Vector2.LEFT)
	paddle.move_toward_local(vec)

func dir_vec(name : String, vector : Vector2) -> Vector2:
	return Input.get_action_strength(name) * vector
