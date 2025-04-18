class_name Player extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $state_machine
@onready var move_component: Node = $move_component
@onready var health_component: Health = $Health
@onready var weaponTimer: Timer = $weaponAttack_Timer
@onready var hit_box: HitBox = $HitBox


var attack_length: float = 16.0


func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self, animations,move_component,health_component )

# do later
#func checkIfAttackHits():
	#var ray = RayCast2D.new()
	#add_child(ray)
	#ray.set_collision_mask_value(7, true)
	#ray.target_position = Vector2(hit_coll.position.x *2, 0)
	#if ray.is_colliding() == true:
		#print("ahh")
	#print(ray)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("primary") && hit_box.can_attack:
		weaponTimer.start()
		hit_box.set_can_attack(false)
	elif event.is_action_released("primary"):
		hit_box.set_can_attack(true)
	else:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if velocity.x < 0:
		hit_box.get_child(0).position.x = -attack_length
	elif velocity.x >0:
		hit_box.get_child(0).position.x = attack_length
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_health_health_depleted() -> void:
	state_machine.process_health(health_component.get_health())

func _on_weapon_attack_timer_timeout() -> void:
	hit_box.set_can_attack(true)
