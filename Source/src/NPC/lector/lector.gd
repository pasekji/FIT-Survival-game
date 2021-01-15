extends KinematicBody2D

export(Array, String) var dialog
var notes_length = 0
var notes_index = 0

func _ready():
	notes_length = $fileread.text.size()
	print(notes_length)
	$Dialogue/Popup/Panel.set_global_position(Vector2(3800, 1900))
	

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
	if body.name == 'Player':
		$TimerLecture.stop()
		notes_index = 35
		dialogue($fileread.text[notes_index])
