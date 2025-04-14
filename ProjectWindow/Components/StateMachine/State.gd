class_name State extends Node

@export var animation_name: String
@export var move_speed: float = 300
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

## Hold a reference to the parent so that it can be controlled by the state
var parent: CharacterBody2D
var animations: AnimatedSprite2D
var move_component
var health_component

func enter() -> void:
	animations.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null

func get_movement_input() -> float:
	return move_component.get_movement_direction()

func get_jump() -> bool:
	return move_component.wants_jump()
	
func process_health(_current_health: float) -> State:
	return null
