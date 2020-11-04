extends Sprite


func _on_Area2D_body_entered(body):
	print("tst")
	var scene = get_tree().get_current_scene().get_name() 
	if scene == 'Basefloor':
		get_tree().change_scene("res://src/Levels/1st floor.tscn")
	else:
		get_tree().change_scene("res://src/Levels/LevelTemplate.tscn")
