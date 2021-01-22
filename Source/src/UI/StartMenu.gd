extends CanvasLayer
var restart = false


func _ready():
	BGMusic.change("main")
	OS.window_fullscreen = true


# START GAME
func _on_Button_pressed():
	startGame()

# EXIT GAME
func _on_Button2_pressed():
	get_tree().quit()

# SHOW CREDITS
func _on_Button3_pressed():
	showCredits()


func startGame():
	if Global.restart:
		Global.restartGame()
	else:
		get_tree().change_scene("res://src/Levels/0Gate.tscn")
	
func showCredits():
	BGMusic.change("title")
	$Control/Credits/Control.show()
