extends State

@export var fall_state: State
@export var move_state: State
@export var death_state: State
@export var attack_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	return null

func process_health(current_health: float) -> State:
	if current_health <= 0:
		return death_state
	return null
