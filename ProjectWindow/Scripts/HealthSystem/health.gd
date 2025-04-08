class_name Health extends Node

signal max_health_changed(diff: float)
signal health_changed(diff: float)
signal health_depleted

@export var max_health: float = 10 : set = set_max_health, get = get_max_health
@export var immortality: bool = false : set = set_immortality, get = get_immortality

var immortality_timer: Timer = null
var current_health: float = max_health : set = set_health, get = get_health


func set_max_health(value: float):
	var clamped_value: float = 1.0 if value <= 0.0 else value
	
	if not clamped_value == max_health:
		var difference = clamped_value - max_health
		max_health = value
		max_health_changed.emit(difference)
		
		if current_health > max_health:
			current_health = max_health
	
func get_max_health() -> float:
	return max_health

func set_immortality(value: bool):
	immortality = value

func get_immortality() -> bool:
	return immortality

func set_temp_immortality(time: float):
	if immortality_timer == null:
		immortality_timer = Timer.new()
		immortality_timer.one_shot = true
		add_child(immortality_timer)
		
	if immortality_timer.timeout.is_connected(set_immortality):
		immortality_timer.timeout.disconnect(set_immortality)
	
	immortality_timer.set_wait_time(time)
	immortality_timer.timeout.connect(set_immortality.bind(false))
	immortality = true
	immortality_timer.start()
		

func set_health(value: float):
	if value < current_health and immortality:
		return
	
	var clamped_value = clamp(value, 0, max_health)
	
	if clamped_value != current_health:
		var difference = clamped_value - current_health
		current_health = clamped_value
		health_changed.emit(difference)
		
		if current_health == 0:
			health_depleted.emit()

func get_health() -> float:
	return current_health
