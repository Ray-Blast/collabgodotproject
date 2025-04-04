class_name State extends Node


func Enter():
	pass

func Exit():
	pass

func handle_input(_event: InputEvent) -> void:
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

signal finished(next_state_path: String, delta: Dictionary)
