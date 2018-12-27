extends Area2D

const move_speed = -100
const damage = 1
const max_height = 20

func _process(delta):
	global_position.y += move_speed * delta
	if global_position.y <= max_height:
		queue_free()
		GameState.health -= damage