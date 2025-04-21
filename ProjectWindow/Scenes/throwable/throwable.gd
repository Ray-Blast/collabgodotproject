class_name Throwable extends AnimatableBody2D

@export var direction: float = 1
@export var speed: float = 10.0
@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_box: HitBox = $HitBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if direction < 0:
		animated_sprite_2d.flip_h = true

func _physics_process(_delta: float) -> void:
	position.x += direction * speed

func _on_timer_timeout() -> void:
	queue_free()
