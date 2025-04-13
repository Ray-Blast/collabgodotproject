extends Moveable

var direction := 1
var target: Player = null

func get_movement_direction() -> float:
	return 0

func wants_jump() -> bool:
	return false
