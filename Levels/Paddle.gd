extends StaticBody2D
class_name Paddle

@export
var direction : RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Returns the angle of the paddle direction from 0,1 in radians
func get_direction() -> float:
	return direction.get_angle_to(Vector2.UP)
