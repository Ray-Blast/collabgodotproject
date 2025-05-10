extends State

func enter() -> void:
	super()
	parent.velocity.x = 0
	if parent.is_in_group("player"):
		call_deferred("restart")
	else:
		parent.queue_free()

func restart() -> void:
	get_tree().reload_current_scene()
