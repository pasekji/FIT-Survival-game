extends KinematicBody2D
export(Array, String) var dialog
var speed = 155
var index = 0
	
func _physics_process(delta):
	get_parent().set_offset(get_parent().get_offset() + 400 * delta)
	$Dialogue/Popup/Panel.set_global_position(self.global_position)
	

func _load_dialog():
	if index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[index]
	else:
		$Dialogue/Popup.hide()


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		index = 0
		_load_dialog()


func _on_Area2D_body_exited(body):
	index = 200
	_load_dialog()
