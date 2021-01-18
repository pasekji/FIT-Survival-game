extends CanvasLayer

func _input(event):
	if event.is_action_type():
		$Control.hide()
