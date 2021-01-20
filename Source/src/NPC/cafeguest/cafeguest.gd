extends KinematicBody2D
export(Array, String) var dialog
export(Vector2) var cafeteria_lady_position = Vector2(310, 440)
const path = preload("res://src/Paths/CafeGuestPathReturn.tscn")
var speed = 155
var index = 0
var do_idle = 0
#func _ready():
#	set_physics_process(true)
	
func _physics_process(delta):
	if do_idle == 0:
		$AnimationPlayer.current_animation = "walkleft"
	else:
		$AnimationPlayer.current_animation = "idleleft"
	get_parent().set_offset(get_parent().get_offset() + 400 * delta)
	$Dialogue/Popup/Panel.set_global_position(Vector2(self.global_position.x + 100, self.global_position.y - 100))
	

func _load_dialog():
	do_idle = 1
	if index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[index]
	else:
		$Dialogue/Popup.hide()



func _on_Timer_timeout():
	if index == 3:
		$Timer.stop()
		spawnReturn()
		queue_free()
	_load_dialog()
	index = index + 1

func spawnReturn():
	var returnPath = path.instance()
	get_parent().call_deferred("add_child", returnPath)

func _on_Area2D_body_entered(body):
	if body.name == 'Player' and $Timer.is_stopped():
		index = 0
		_load_dialog()
		print('again')
		$Gibber.play()
		
	if body.name == 'CafeteriaLady':
		index = 1
		$Timer.start(2)

