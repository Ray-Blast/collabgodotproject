extends Moveable

var direction := 1
@export var StrafeChance = 99
var rng = RandomNumberGenerator.new()


func get_movement_direction() -> float:
	if parent.is_on_wall():
		direction *= -1
	else:
		rng.randomize()
		var num = rng.randi_range(0, 100)
		if num %StrafeChance == 0:
			direction *= -1
	return direction

func wants_jump() -> bool:
	return false
