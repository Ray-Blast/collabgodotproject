extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State
@export var death_state: State
@export var attack_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(_event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	if get_movement_input() != 0.0:
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

func process_health(current_health: float) -> State:
	if current_health <= 0:
		return death_state
	return null

func process_attack() -> State:
	return attack_state
	
