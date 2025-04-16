extends State

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State
@export var death_state: State
@export var attack_state: State

func process_input(_event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = get_movement_input() * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
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
	
