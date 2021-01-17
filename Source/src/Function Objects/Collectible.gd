extends Area2D
var timer = 2 #wait 2 seconds
onready var sprite = get_node("Sprite")
onready var effect = get_node("Tween")


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		#effect.interpolate_property(sprite, "modulate",
		#Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, 
		#Tween.TRANS_LINEAR, Tween.EASE_IN)
		queue_free()
		Global.ISIC = true
