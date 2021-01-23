extends CanvasLayer

func _ready():
	$Control.hide()
	
func _input(_event):
	if Input.is_action_pressed("escape"):
		$Control.visible = ! $Control.visible

# CONTINUE
func _on_Button_pressed():
	$Control.hide()

# EXIT
func _on_Button2_pressed():
	Global.restart = true
	get_tree().change_scene("res://src/UI/StartMenu.tscn")
	

# CREDITS
#func _on_Button3_pressed():
#	$Control/Credits/Control.show()
