extends Node2D

func _ready():
	if (randi() % 2) == 0:
		$TextureRect.texture = load("res://assets/coin.png")
	else:
		$TextureRect.texture = load("res://assets/light.png")
