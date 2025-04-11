class_name HitBox extends Area2D

@onready var hit_coll: CollisionShape2D = $CollisionShape2D
@export var damage: int = 1 : set = set_damage, get = get_damage

var can_attack : bool = true

func set_damage(value: int) -> void:
	damage = value

func get_damage() -> int:
	return damage

func get_can_attack() -> bool:
	return can_attack
	

func set_can_attack(value: bool) -> void:
	can_attack = value
	if can_attack == true:
		disable_attack()
	else:
		enable_attack()
	
func enable_attack() -> void:
	hit_coll.disabled = false
	

func disable_attack() -> void:
	hit_coll.disabled = true
	
