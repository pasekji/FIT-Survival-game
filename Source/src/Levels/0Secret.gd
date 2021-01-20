extends Node2D


func _ready():
	BGMusic.quiet()
	

func _input(event):
	if event.is_action_pressed("pc_toggle"):
		$PC/AudioStreamPlayer2D.playing = !$PC/AudioStreamPlayer2D.playing
