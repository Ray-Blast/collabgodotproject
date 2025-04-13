extends State

@export var move_state: State
@export var death_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(_event: InputEvent) -> State:
	if get_movement_input() != 0.0:
		return move_state
	return null

func process_physics(delta: float) -> State:
	return null


func process_health(current_health: float) -> State:
	if current_health <= 0:
		return death_state
	return null
