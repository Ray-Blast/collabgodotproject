class_name Player extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $state_machine
@onready var move_component: Node = $move_component
@onready var attackRay: RayCast2D = $attackRay

var attack_length: float = 60.0


func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self, animations,move_component)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("primary") and attackRay.is_colliding():
		print(attackRay.get_collider())
	else:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if velocity.x < 0:
		attackRay.target_position.x = -attack_length
	elif velocity.y > 0:
		attackRay.target_position.x = attack_length
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
