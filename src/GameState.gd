extends Node

signal score_changed(new_score)

var score = 0 setget _score_set

func _score_set(new_score):
	score = new_score
	emit_signal("score_changed", new_score)