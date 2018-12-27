extends Node

signal score_changed(new_score)

const reload_time = 3.0

var score = 0 setget _score_set
var can_fire = true
onready var fire_timer = Timer.new()

func _ready():
	fire_timer.wait_time = reload_time
	fire_timer.one_shot = true
	add_child(fire_timer)
	fire_timer.connect("timeout", self, "_on_timer_timeout")

func _score_set(new_score):
	score = new_score
	emit_signal("score_changed", new_score)

func fired():
	can_fire = false
	fire_timer.start()

func _on_timer_timeout():
	can_fire = true