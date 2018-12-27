extends ProgressBar

func _ready():
	max_value = GameState.max_health
	value = GameState.health
	GameState.connect("health_changed", self, "_on_GameState_health_changed")

func _on_GameState_health_changed(new_health):
	value = new_health