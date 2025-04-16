class_name State_Machine extends Node

@export var starting_state: State
var current_state: State

func init(parent: CharacterBody2D, animations: AnimatedSprite2D, move_component, health_component, animation_player: AnimationPlayer) -> void:
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.move_component = move_component
		child.health_component = health_component
		child.animation_player = animation_player

	change_state(starting_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
	

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_health(current_health: float) -> void:
	print("ah")
	var new_state = current_state.process_health(current_health)
	if new_state:
		change_state(new_state)

func process_attack() -> void:
	var new_state = current_state.process_attack()
	if new_state:
		change_state(new_state) 
	#var new_state = current_state.process_attack()
	#if new_state:
		#change_state(new_state)
