extends CharacterBody2D

var launchVal = -100

func _ready() -> void:
	velocity.y += launchVal
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += 250 * delta

	move_and_slide()
