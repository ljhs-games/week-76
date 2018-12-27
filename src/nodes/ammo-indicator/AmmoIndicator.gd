extends HBoxContainer

func _ready():
	GameState.connect("ammo_changed", self, "_on_GameState_ammo_set")
	$Label.text = str(GameState.ammo)

func _on_GameState_ammo_set(new_ammo):
	$Label.text = str(new_ammo)