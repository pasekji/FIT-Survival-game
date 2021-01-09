extends Control

export(Array, String) var dialog

var dialog_index = 0

	
func _load_dialog():
	if dialog_index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[dialog_index]
		dialog_index += 1
	else:
		$Popup.hide()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		_load_dialog()
	pass


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		print(body.name)
		_load_dialog()
	pass
