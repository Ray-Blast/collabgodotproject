extends CenterContainer

var first_level = "res://Scenes/levels/level_1_1.tscn"
# Called when the node enters the scene tree for the first time.


func _on_new_game_button_pressed() -> void:
	Global.game_controller.change_2d_scene(first_level, false, false)
	queue_free()
