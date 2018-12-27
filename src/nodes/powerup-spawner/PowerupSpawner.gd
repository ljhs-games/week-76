extends Node2D

export (PackedScene) var powerup_pack
export var time_range = Vector2(0.5, 1.5)

func _ready():
	randomize()
	$SpawnTimer.wait_time = get_rand_time()
	$SpawnTimer.start()

func get_rand_time():
	return rand_range(time_range.x, time_range.y)

func _on_SpawnTimer_timeout():
	var cur_powerup = powerup_pack.instance()
	add_child(cur_powerup)
	cur_powerup.global_position = Vector2(-100, rand_range(50,650))
	$SpawnTimer.wait_time = get_rand_time()
	$SpawnTimer.start()