extends CharacterBody2D


const BASE_SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = Vector2()

@onready var char_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction.x = Input.get_axis("left", "right")
	if direction.x < 0:
		char_sprite.flip_h = true
	elif direction.x > 0:
		char_sprite.flip_h = false;
		
	if direction:
		velocity.x = direction.x * BASE_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, BASE_SPEED)

	move_and_slide()
