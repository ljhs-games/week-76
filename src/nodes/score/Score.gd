extends Label

func _ready():
	GameState.connect("score_changed", self, "_on_GameState_score_changed")
	_on_GameState_score_changed(GameState.score)

func _on_GameState_score_changed(new_score):
	text = str(new_score)