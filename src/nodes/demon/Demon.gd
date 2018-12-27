extends Area2D

const damage = 10
const move_speed = 100
const escape_height = 100

func _ready():
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