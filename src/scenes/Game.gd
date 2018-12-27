extends Node2D

func _ready():
	BackgroundMusicPlayer.stream = preload("res://scenes/sniper-training.ogg")
	BackgroundMusicPlayer.play()
	GameState.health = GameState.max_health
	GameState.ammo = GameState.max_ammo
	GameState.score = 0