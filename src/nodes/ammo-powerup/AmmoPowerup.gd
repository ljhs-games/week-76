extends Area2D

const move_speed = 200

func _ready():
	set_process(true)

func _process(delta):
	global_position.x += move_speed*delta

func get():
	GameState.ammo += 3
	queue_free()