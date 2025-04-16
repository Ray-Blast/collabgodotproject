extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y += -300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
