extends CanvasLayer

func _ready():
	$Control.hide()
	
func _input(event):
	if Input.is_action_pressed("escape"):
		$Control.visible = ! $Control.visible
