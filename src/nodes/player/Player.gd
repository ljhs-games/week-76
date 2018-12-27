extends Sprite

const move_accel = 9.8
const max_velocity = 100.0
const acceptable_radius = 20.0

var acceleration = Vector2()
var velocity = Vector2()
var target_position = Vector2(350, 350)

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
	acceleration = (target_position - global_position).normalized()*move_accel
	velocity += acceleration
	velocity = 
	print(velocity.length())
	if global_position.distance_to(target_position) <= acceptable_radius and velocity.length() >= 100.0:
		velocity = Vector2()
		global_position = target_position
	global_position += velocity*delta
	#print(target_position - global_position)
	#global_position = target_position

func _input(event):
	if event is InputEventMouseMotion:
		target_position = event.global_position