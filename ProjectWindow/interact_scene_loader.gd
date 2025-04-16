extends Area2D

@export var pathToNewLevel: String

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.game_controller.change_2d_scene(pathToNewLevel,false, false)
		#Global.game_controller.change_gui_scene(pathToNewLevel,false, false)
