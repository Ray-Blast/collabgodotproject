extends State

#@export var fall_state: State
#@export var jump_state: State
#@export var attacking_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
