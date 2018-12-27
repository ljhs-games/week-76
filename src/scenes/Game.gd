extends Node2D

func _ready():
	BackgroundMusicPlayer.stream = preload("res://scenes/sniper-training.ogg")
	BackgroundMusicPlayer.play()
	GameState.health = GameState.max_health
	GameState.ammo = GameState.max_ammo
	GameState.score = 0
	GameState.connect("game_over", self, "_on_GameState_game_over")

func _on_GameState_game_over():
	get_tree().change_scene("res://scenes/GameOver.tscn")