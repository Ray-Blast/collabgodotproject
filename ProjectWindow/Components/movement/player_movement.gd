extends Node

@export var parent: CharacterBody2D
func get_movement_direction() -> float:
	return Input.get_axis("left", "right")

func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")
