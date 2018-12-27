extends Sprite

const move_accel = 20.0
export var max_velocity = 400.0

const acceptable_radius = 10.0

var acceleration = Vector2()
var velocity = Vector2()
var target_position = Vector2(350, 350)
var in_radius = false

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
	acceleration = (target_position - global_position).normalized()*move_accel
	velocity += acceleration
	velocity.x = clamp(velocity.x, -max_velocity, max_velocity)
	velocity.y = clamp(velocity.y, -max_velocity, max_velocity)
	#print(velocity.length())
	if global_position.distance_to(target_position) <= acceptable_radius:
		if in_radius:
			pass
		else:
			in_radius = true
			velocity = Vector2()
			global_position = target_position
	else:
		in_radius = false
	global_position += velocity*delta
	#print(target_position - global_position)
	#global_position = target_position

func _input(event):
	if event is InputEventMouseMotion:
		target_position = event.global_position
	elif event.is_action_pressed("g_fire"):
		if GameState.can_fire:
			$FirePlayer.play()
			$AnimationPlayer.play("fire")
			$ReloadSoundTimer.wait_time = GameState.fire_timer.wait_time - $ReloadPlayer.stream.get_length()
			$ReloadSoundTimer.start()
			GameState.fired()

func _on_ReloadSoundTimer_timeout():
	$ReloadPlayer.play()