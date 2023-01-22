extends CharacterBody2D
class_name Paddle

@export
var direction : RayCast2D

@export
var speed : float = 40

# Returns the angle of the paddle direction from 0,1 in radians
func get_direction() -> float:
	return direction.get_angle_to(Vector2.UP)


func move_toward(position: Vector2) -> void:
	var relative_position = position - global_position
	var target = project_to_movement_axis(relative_position).normalized()
	velocity = target


func project_to_movement_axis(target: Vector2) -> Vector2:
	return target.project(direction.target_position.rotated(PI/2))


func _physics_process(delta : float):
	move_and_collide(velocity * delta * speed)
