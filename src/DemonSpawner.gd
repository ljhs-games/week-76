extends Node2D

const time_range = Vector2(1.0, 3.0)
const demon_pack = preload("res://nodes/demon/Demon.tscn")

func _ready():
	$SpawnTimer.wait_time = get_rand_time()
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	var cur_demon = demon_pack.instance()
	add_child(cur_demon)
	cur_demon.global_position = Vector2(rand_range(0, 700), 800)
	$SpawnTimer.wait_time = get_rand_time()
	$SpawnTimer.start()

func get_rand_time():
	return rand_range(time_range.x, time_range.y)