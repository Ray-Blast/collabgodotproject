extends State

func enter() -> void:
	super()
	parent.velocity.x = 0
	if parent.is_in_group("player"):
		get_tree().reload_current_scene()
	else:
		parent.queue_free()
