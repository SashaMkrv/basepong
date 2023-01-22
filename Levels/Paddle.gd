extends CharacterBody2D
class_name Paddle

@export
var direction : RayCast2D

@export
var speed : float = 100

# Returns the angle of the paddle direction from 0,1 in radians
func get_direction() -> float:
	return direction.get_angle_to(Vector2.UP)

func get_axis() -> Vector2:
	var direction_vec = direction.target_position
	return Vector2(direction_vec.y, -direction_vec.x)

func move_toward(position: Vector2) -> void:
	var relative_position = position - global_position
	var target = project_to_movement_axis(relative_position).normalized()
	velocity = target


func move_toward_local(direction: Vector2) -> void:
	var target = project_to_movement_axis(direction).normalized()
	velocity = target

func project_to_movement_axis(target: Vector2) -> Vector2:
	return target.project(get_axis())


func _physics_process(delta : float):
	move_and_collide(velocity * delta * speed)
