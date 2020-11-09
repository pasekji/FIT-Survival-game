tool 

extends Sprite

export(String, FILE) var next_scene_path = ""


func _on_Area2D_body_entered(body):
	get_tree().change_scene(next_scene_path)
