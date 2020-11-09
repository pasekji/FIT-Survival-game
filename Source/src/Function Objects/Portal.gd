extends Sprite


func _on_Area2D_body_entered(_body):
	var goal =  "res://src/Levels/" + String(self.name) + ".tscn"
	get_tree().change_scene(String(goal))
