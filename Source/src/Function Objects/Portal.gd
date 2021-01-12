tool 

extends Sprite

export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO

func _on_Area2D_body_entered(body):
	if Global.ISIC and body.name == 'Player':
		get_tree().change_scene(next_scene_path)
		Global.player_initial_map_position = player_spawn_location
