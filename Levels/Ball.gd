extends RigidBody2D

@export
var speed : float = 50
@export
var bounce_range : float = 75

var original_position : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	original_position = position
	self.max_contacts_reported = 2
	self.contact_monitor = true
	apply_bounce_impulse(Vector2.LEFT)
	pass # Replace with function body.


func reset_position():
	position = original_position

func apply_bounce_impulse(bounce: Vector2):
	apply_central_impulse(bounce * speed * 2) # to cancel out the original one, I guess.

func _on_body_entered(body: Node):
	if body.is_in_group("paddle"):
		apply_bounce(body)
		print_debug("Entered paddle")
		return
	if body.is_in_group("goal"):
		reset_position()
		print_debug("Entered goal")
		return
	print_debug("Entered Something.")


func apply_bounce(body: Paddle):
	var paddleDir = body.get_direction()
	var bounceDir = create_bounce_vector()
	var rotatedDir = bounceDir.rotated(paddleDir)
	apply_bounce_impulse(rotatedDir)


func create_bounce_vector() -> Vector2:
	var randomWobble = randf_range(-1 * bounce_range, 1 * bounce_range)
	return Vector2(randomWobble, 1).normalized()
