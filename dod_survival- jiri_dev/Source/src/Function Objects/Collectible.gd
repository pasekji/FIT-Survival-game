extends Area2D



func _on_Area2D_body_entered(body):
	queue_free()
	Global.ISIC = true
