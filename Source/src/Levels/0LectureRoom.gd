extends Node2D
var dialog_index = 0

func _ready():
	$Player.global_position = Vector2(200, 3800)
	hide_all()


func show_choice():
	print(dialog_index)
	if dialog_index == 1:
		$CanvasLayer/Question1/Button.text = "Ehm, four?"
		$CanvasLayer/Question1/Button2.text = "Depends on K value"
		$CanvasLayer/Question1/Button3.text = "I am sorry profesor but I got lost. This is not my lesson."
		$CanvasLayer/Question1.show()

func hide_all():
	$CanvasLayer/Question1.hide()
	$CanvasLayer/Question2.hide()

func q1b1():
	hide_all()
	if dialog_index == 1:
		dialog_index = 11



func q1b2():
	hide_all()


func q1b3():
	hide_all()
