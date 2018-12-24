extends Node2D
const health = 100

func _on_Demon_lose_point():
	health = health - 1
	print(health)