extends Node2D

func _ready():
	BackgroundMusicPlayer.stream = preload("res://scenes/cutscenes/nyeh-heh-heh.ogg")
	BackgroundMusicPlayer.play()