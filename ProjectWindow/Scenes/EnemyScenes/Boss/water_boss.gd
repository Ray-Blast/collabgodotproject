extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $state_machine
@onready var move_component: Node = $move_component
@onready var health_component: Health = $Health
@onready var attack_state_machine: StateMachine = $attack_state_machine

func _ready() -> void:
	state_machine.init(self, animations, move_component,health_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_health_health_depleted() -> void:
	state_machine.process_health(health_component.get_health())
