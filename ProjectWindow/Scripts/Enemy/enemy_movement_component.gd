class_name Enemy_Moveable extends Node

@export var parent: CharacterBody2D
var direction := 1.0

func get_movement_direction() -> float:
	if parent.is_on_wall():
		direction *= -1
	return direction

func wants_jump() -> bool:
	return false
