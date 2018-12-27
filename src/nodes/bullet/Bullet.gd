extends Area2D

const bullet_hole_pack = preload("res://nodes/bullet/BulletHoleSprite.tscn")

var fired = false
var hit_something = false

func _ready():
	set_physics_process(true)

func fire(target_position):
	global_position = target_position
	fired = true

func _physics_process(delta):
	if fired:
		var areas = get_overlapping_areas()
		for a in areas:
			if a.is_in_group("powerup"):
				a.get()
				queue_free()
				hit_something = true
				break
			elif a.is_in_group("shield"):
				a.hit()
				GameState.ammo -= 1
				$DestroyTimer.wait_time = max($WoodParticles.lifetime, $ShieldHitStreamPlayer.stream.get_length())
				$DestroyTimer.start()
				$WoodParticles.emitting = true
				hit_something = true
				break
			elif a.is_in_group("demon"):
				a.hit()
				GameState.ammo -= 1
				var cur_bullet_hole = bullet_hole_pack.instance()
				a.add_child(cur_bullet_hole)
				cur_bullet_hole.global_position = global_position
				$DestroyTimer.wait_time = max($BloodyParticles.lifetime, $DemonHitStreamPlayer.stream.get_length())
				$DestroyTimer.start()
				$BloodyParticles.emitting = true
				hit_something = true
				break
		if !hit_something: # hit a wall
			GameState.ammo -= 1
			$DestroyTimer.wait_time = max($WallParticles.lifetime, $MissStreamPlayer.stream.get_length())
			$DestroyTimer.start()
			$MissStreamPlayer.play()
			$WallParticles.emitting = true
		set_physics_process(false)

func _on_DestroyTimer_timeout():
	queue_free()