extends State

func enter() -> void:
	parent.queue_free()
	parent.velocity.x = 0
