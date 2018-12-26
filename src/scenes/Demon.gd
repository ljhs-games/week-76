extends Area2D

const move_speed = -1
const damage = 1

func _process(delta):
	global_position.y += move_speed
	if global_position.y <= 20:
		queue_free()
		var health = get_parent().max_health
		health -= damage