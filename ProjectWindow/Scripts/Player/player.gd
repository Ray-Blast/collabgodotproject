class_name Player extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $state_machine
@onready var move_component: Node = $move_component


func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self, animations,move_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
