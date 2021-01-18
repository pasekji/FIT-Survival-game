extends CanvasLayer


func _ready():
	#startGame()
	pass
	
	
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
	get_tree().change_scene("res://src/Levels/0Gate.tscn")

func showCredits():
	$Control/Credits/Control.show()
