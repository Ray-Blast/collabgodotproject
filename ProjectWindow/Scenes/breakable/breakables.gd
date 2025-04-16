extends StaticBody2D

@onready var pickup = load("res://Scenes/pickup/pickup.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

enum breakable_type {TORCH, POT}
@export var typeofBreakable: String = "torch"

func _ready() -> void:
	match breakable_type:
		1:
			animated_sprite_2d.play(typeofBreakable)
		2:
			animated_sprite_2d.play(typeofBreakable)
	

func spawn_instance_logic(instance: Node2D) -> void:
	get_parent().add_child(instance)
	instance.position.x = position.x
	instance.position.y = position.y
	
func _on_health_health_depleted() -> void:
	var instance = pickup.instantiate()
	var callable = spawn_instance_logic.bind(instance)
	callable.call_deferred()
	queue_free()
