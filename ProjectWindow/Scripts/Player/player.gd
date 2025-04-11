class_name Player extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $state_machine
@onready var move_component: Node = $move_component
@onready var hit_coll: CollisionShape2D = $HitBox/CollisionShape2D
@onready var health_component: Health = $Health
@onready var weaponTimer: Timer = $weaponAttack_Timer

var can_attack: bool = true

var attack_length: float = 33.0


func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self, animations,move_component,health_component )

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("primary") && can_attack:
		weaponTimer.start()
		can_attack = false
		hit_coll.disabled = false
	elif event.is_action_released("primary"):
		hit_coll.disabled = true
	else:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if velocity.x < 0:
		hit_coll.position.x = -attack_length
	elif velocity.x >0:
		hit_coll.position.x = attack_length
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_health_health_depleted() -> void:
	state_machine.process_health(health_component.get_health())


func _on_weapon_attack_timer_timeout() -> void:
	can_attack = true
