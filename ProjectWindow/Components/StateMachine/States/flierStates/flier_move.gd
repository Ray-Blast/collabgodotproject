extends State

@export var idle_state: State
@export var death_state: State
@export var attack_state: State

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	var movement = get_movement_input() * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	return null

func process_health(current_health: float) -> State:
	if current_health <= 0:
		return death_state
	return null

func process_attack() -> State:
	print("hmm")
	return attack_state
	
