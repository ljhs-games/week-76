extends Area2D
signal lose_point

func _process(delta):
	move_local_y(-.5)
	if position.y <= 20:
		queue_free()
		emit_signal("lose_point")