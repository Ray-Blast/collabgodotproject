class_name Player extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: State_Machine = $state_machine
@onready var move_component: Node = $move_component
@onready var health_component: Health = $Health
@onready var weaponTimer: Timer = $weaponAttack_Timer
@onready var hit_box: HitBox = $HitBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cam: Camera2D = $Camera2D

var throwable = load("res://Scenes/throwable/throwable.tscn")

var direction = 1
var attack_length: float = 16.0

func _ready() -> void:
	state_machine.init(self, animations,move_component,health_component, animation_player,  )

func spawn_instance_logic(instance: Node2D) -> void:
	instance.direction = direction
	instance.position.x = (self.position.x)
	instance.position.y = position.y
	get_parent().add_child(instance)
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("primary"):
		state_machine.process_attack()
		weaponTimer.start()
	elif event.is_action_pressed("secondary"):
		var instance = throwable.instantiate()
		var callable = spawn_instance_logic.bind(instance)
		callable.call_deferred()
		
	else:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if velocity.x < 0:
		hit_box.get_child(0).position.x = -attack_length
		direction = -1
	elif velocity.x >0:
		hit_box.get_child(0).position.x = attack_length
		direction = 1
	state_machine.process_physics(delta)
	

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_health_health_depleted() -> void:
	state_machine.process_health(health_component.get_health())


func _on_animated_sprite_2d_animation_finished() -> void:
	animations.play(state_machine.current_state.animation_name)


func _on_weapon_attack_timer_timeout() -> void:
	animation_player.play("RESET")
