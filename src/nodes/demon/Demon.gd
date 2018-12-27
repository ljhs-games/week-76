extends Area2D

const shield_pack = preload("res://nodes/shield/Shield.tscn")
const damage = 10
const move_speed = 100
const shield_chance = 0.0 # shield not absorbing hit
const escape_height = 100

func _ready():
	randomize()
	if rand_range(0,1) < shield_chance:
		var cur_shield = shield_pack.instance()
		add_child(cur_shield)
		cur_shield.global_position = global_position
	set_process(true)

func _process(delta):
	global_position.y -= move_speed*delta
	if global_position.y < escape_height:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("escape")

func hit():
	if not $AnimationPlayer.is_playing():
		GameState.score += 1
		$AnimationPlayer.play("die")

func decrement_health():
	GameState.health -= damage
	queue_free()