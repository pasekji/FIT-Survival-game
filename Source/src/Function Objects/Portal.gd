extends Sprite


func _on_Area2D_body_entered(_body):
	var scene = get_tree().get_current_scene().get_name() 
	if scene == '0Base':
		get_tree().change_scene("res://src/Levels/1Floor.tscn")
	else:
		get_tree().change_scene("res://src/Levels/0Base.tscn")
