extends KinematicBody2D

export(Array, String) var dialog
var notes_length = 0
var notes_index = 0
var entered = false


func _ready():
	notes_length = $fileread.text.size()
	$Dialogue/Popup/Panel.set_global_position(Vector2(3800, 1900))

func _process(delta):
	if entered and Input.is_action_just_pressed("ui_accept"):
		$TimerLecture.stop()
		notes_index = 35
		dialogue($fileread.text[notes_index])
		get_parent().dialog_index += 1
		get_parent().show_choice()


func dialogue(text):
	$Dialogue/Popup.show()
	$Dialogue/Popup/Panel/RichTextLabel.text = text

func _on_TimerLecture_timeout():
	if notes_index < notes_length:
		dialogue($fileread.text[notes_index])
		notes_index = notes_index + 1
	else:
		notes_index = 0


func _on_Area2D_body_entered(body):
	entered = true


func _on_Area2D_body_exited(body):
	entered = false
