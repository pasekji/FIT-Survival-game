extends KinematicBody2D
export(Vector2) var cafeteria_lady_position = Vector2(310, 440)
var speed = 155
var path = null

func _physics_process(delta):
	var path = get_parent()
	var pos = path.get_offset() + 200 * delta
	path.set_offset(pos)
	
