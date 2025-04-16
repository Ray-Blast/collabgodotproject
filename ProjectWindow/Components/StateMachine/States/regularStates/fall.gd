extends State

@export var idle_state: State
@export var move_state: State
@export var death_state: State

@export var attack_state: State

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('left', 'right') * move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null

func process_health(current_health: float) -> State:
	if current_health <= 0:
		return death_state
	return null


func process_attack() -> State:
	return attack_state
	
