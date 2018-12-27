extends Node

signal score_changed(new_score)
signal ammo_changed(new_ammo)

const reload_time = 3.0
const max_ammo = 6

var score = 0 setget _score_set
var ammo = max_ammo setget _ammo_set
var can_fire = true setget ,_can_fire_get
onready var fire_timer = Timer.new()

func _ready():
	fire_timer.wait_time = reload_time
	fire_timer.one_shot = true
	add_child(fire_timer)
	fire_timer.connect("timeout", self, "_on_timer_timeout")

func _can_fire_get():
	return can_fire and ammo > 0

func _ammo_set(new_ammo):
	ammo = new_ammo
	emit_signal("ammo_changed", new_ammo)

func _score_set(new_score):
	score = new_score
	emit_signal("score_changed", new_score)

func fired():
	can_fire = false
	fire_timer.start()

func _on_timer_timeout():
	can_fire = true