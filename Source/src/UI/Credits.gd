extends CanvasLayer

func _input(event):
	if event.is_action_type():
		if $Control.visible:
			$Control.hide()
			BGMusic.change("main")
