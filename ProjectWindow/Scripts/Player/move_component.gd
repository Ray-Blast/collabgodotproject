class_name Moveable extends Node

@export var parent: CharacterBody2D

func get_movement_direction() -> float:
	return 0.0

func wants_jump() -> bool:
	return false
