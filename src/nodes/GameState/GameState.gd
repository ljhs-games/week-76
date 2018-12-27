extends Node2D

signal health_changed
signal game_over

const max_health = 100
var health = max_health

func _ready():
	if health == health - 1:
		print("K")
		emit_signal("health_changed")
	elif health <= 0:
		emit_signal("game_over")