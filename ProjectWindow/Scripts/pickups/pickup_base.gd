class_name Pickup extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(body)
	if get_parent().is_in_group("levelstuff"):
		get_parent().queue_free()
	else:
		queue_free()
