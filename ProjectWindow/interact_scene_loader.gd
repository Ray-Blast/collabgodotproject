extends Area2D

@export var pathToNewLevel: String

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("change_scene")
		

func change_scene() -> void:
	Global.game_controller.change_2d_scene(pathToNewLevel, true, false)
