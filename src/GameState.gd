extends Node

signal score_changed(new_score)
signal health_changed(new_health)
signal ammo_changed(new_ammo)
signal game_over

const reload_time = 1.5
const max_health = 100
const max_ammo = 6

var score = 0 setget _score_set
var ammo = max_ammo setget _ammo_set
var health = max_health setget _health_set
var can_fire = true setget ,_can_fire_get
onready var fire_timer = Timer.new()

func _ready():
	fire_timer.wait_time = reload_time
	fire_timer.one_shot = true
	add_child(fire_timer)
	fire_timer.connect("timeout", self, "_on_timer_timeout")

func _can_fire_get():
	return can_fire

func _ammo_set(new_ammo):
	if new_ammo < max_ammo:
		ammo = new_ammo
	else:
		ammo = max_ammo
	emit_signal("ammo_changed", ammo)

func _health_set(new_health):
	health = new_health
	if health <= 0:
		emit_signal("game_over")
	emit_signal("health_changed", new_health)

func _score_set(new_score):
	score = new_score
	emit_signal("score_changed", new_score)

func fired():
	can_fire = false
	#GameState.ammo -= 1
	fire_timer.start()

func _on_timer_timeout():
	can_fire = true