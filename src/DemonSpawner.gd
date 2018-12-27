extends Node2D

const time_range = Vector2(3.0, 4.0)
const demon_pack = preload("res://nodes/demon/Demon.tscn")
const less_time_velocity = 0.05

var cur_offset = 0.0

func _ready():
	$SpawnTimer.wait_time = get_rand_time()
	$SpawnTimer.start()
	set_process(true)

func _process(delta):
	cur_offset += less_time_velocity*delta

func _on_SpawnTimer_timeout():
	var cur_demon = demon_pack.instance()
	add_child(cur_demon)
	cur_demon.global_position = Vector2(rand_range(0, 700), 800)
	$SpawnTimer.wait_time = get_rand_time() - cur_offset
	$SpawnTimer.start()

func get_rand_time():
	return rand_range(time_range.x, time_range.y)