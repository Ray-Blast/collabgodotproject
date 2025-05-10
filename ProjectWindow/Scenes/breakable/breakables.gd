extends StaticBody2D

@onready var pickup = load("res://Scenes/pickup/pickup.tscn")
@onready var light: PointLight2D = $light
@onready var anims: AnimatedSprite2D = $AnimatedSprite2D

@export var lightOn: bool = false

enum typeOfBreakable {POT, TORCH}
@export var breakable:typeOfBreakable = 0

func _ready() -> void:
	
	match breakable:
		0:
			anims.play("pot")
		1:
			anims.play("torch")
			light.enabled

func spawn_instance_logic(instance: Node2D) -> void:
	get_parent().add_child(instance)
	instance.position.x = position.x
	instance.position.y = position.y
	
func _on_health_health_depleted() -> void:
	var instance = pickup.instantiate()
	var callable = spawn_instance_logic.bind(instance)
	callable.call_deferred()
	queue_free()
