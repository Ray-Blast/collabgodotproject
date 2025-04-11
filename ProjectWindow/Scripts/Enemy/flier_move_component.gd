extends Moveable

var direction := 1
var target: Player = null

func get_movement_direction() -> float:
	if target == null:
		if parent.is_on_wall():
			direction *= -1
	elif target.is_in_group("player"):
		direction = target.get_angle_to(self.position)
		
	return direction

func wants_jump() -> bool:
	return false
