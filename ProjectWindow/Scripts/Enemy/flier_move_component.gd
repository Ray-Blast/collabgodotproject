extends Moveable

var direction := 1
var target: Player = null

func get_movement_direction() -> float:
	if parent.is_on_wall():
		direction *= -1
	return direction

func wants_jump() -> bool:
	return false
