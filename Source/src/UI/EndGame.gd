extends CanvasLayer
var restart_continue = false


func show():
	BGMusic.change("end")
	var curr_time = OS.get_system_time_secs()
	var duration_sec = curr_time - Global.start_time
	var h = duration_sec / 3600
	var m = (duration_sec - 3600*h)/60
	var s = duration_sec - 3600*h - 60*m
	$Control.show()
	$Control/Panel/VBoxContainer/Label2.text = "TOTAL DISTANCE TRAVELED"
	$Control/Panel/VBoxContainer/Label3.text = String(Global.dist) + " pixels"
	$Control/Panel/VBoxContainer/Label4.text = "TIME PLAYED"
	$Control/Panel/VBoxContainer/Label5.text = String(h) + ":" + String(m) + ":" + String(s)
	$Behold.start(5)


func _on_Behold_timeout():
	restart_continue = true


func _input(_event):
	if Input.is_action_pressed("ui_accept"):
		if restart_continue:
			showMainMenu()
			restart_continue = false


func showMainMenu():
	Global.restart = true
	get_tree().change_scene("res://src/UI/StartMenu.tscn")
