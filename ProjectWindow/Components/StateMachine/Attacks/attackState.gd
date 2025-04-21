extends State

var attackLength = 1
@export var idle_state: State
@export var move_state: State
@export var jump_state: State

signal resetTimer()

func enter() -> void:
	parent.velocity.x = 0
	print("attacking")
	animation_player.play("attack")
	
	
func process_input(_event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor() and attackLength <= 0:
		return jump_state
	if get_movement_input() != 0.0 and attackLength <= 0:
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	attack_cooldown(delta)
	return null

func attack_cooldown(delta: float) -> void:
	attackLength -= delta
	if attackLength == 0:
		resetTimer.emit()

func process_frame(_delta: float) -> State:
	if attackLength <= 0:
		return idle_state
	return null
