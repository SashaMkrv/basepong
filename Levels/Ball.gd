extends RigidBody2D
class_name Ball

@export
var speed : float = 200
@export
#how much of a half-circle around the paddle direction can the ball bounce off in
var bounce_range : float = 0.5
@export
var speed_multiplier : float = 1.1

var original_position : Vector2
var do_reset : bool = false

var current_speed = speed

signal complete_reset()


# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = position
	self.max_contacts_reported = 2
	self.contact_monitor = true


func should_reset():
	do_reset = true

func reset_state(state: PhysicsDirectBodyState2D) -> void:
	do_reset = false
	state.linear_velocity = Vector2.ZERO
	state.angular_velocity = 0
	state.transform.origin = original_position
	current_speed = speed
	complete_reset.emit()

func _integrate_forces(state: PhysicsDirectBodyState2D):
	if do_reset:
		reset_state(state)
		return
	state.linear_velocity = maintain_speed(state.linear_velocity)


func maintain_speed(direction : Vector2) -> Vector2:
	return direction.normalized() * current_speed


func apply_multiplier():
	current_speed = current_speed * speed_multiplier

func apply_bounce_impulse(bounce: Vector2):
	apply_central_impulse(bounce * speed * 2) # to cancel out the original one, I guess.

func _on_body_entered(body: Node):
	if body.is_in_group("paddle"):
		apply_bounce(body)
		apply_multiplier()
		print_debug("Entered paddle")
		return
	if body.is_in_group("goal"):
		print_debug("Entered goal")
		return
	print_debug("Entered Something.")


func apply_bounce(paddle: Paddle):
	var bounceDir = create_bounce_vector(paddle.get_direction().normalized())
	print_debug(bounceDir)
	apply_bounce_impulse(bounceDir)


func create_bounce_vector(original_vector : Vector2) -> Vector2:
	var radian_range  = PI * bounce_range
	var random_rotation = randf_range(-radian_range, radian_range)
	return original_vector.rotated(random_rotation)
