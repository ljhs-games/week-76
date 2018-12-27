extends Node2D

func _ready():
	BackgroundMusicPlayer.stream = preload("res://scenes/sniper-training.ogg")
	BackgroundMusicPlayer.play()