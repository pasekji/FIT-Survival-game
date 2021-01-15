extends KinematicBody2D

export(Array, String) var dialog
const path = preload("res://src/Paths/CafeGuestPath.tscn")

var player_buys = false
var player_response = false
var spawned = false
var focus = 'Player'
var index = 1

func _ready():
	_load_dialog(0)
	$Dialogue/Popup/Panel.set_global_position(Vector2(self.global_position.x-200, self.global_position.y - 300))


func _load_dialog(dialog_index):
	if dialog_index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[dialog_index]


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if player_buys:
			player_response = true
			_load_dialog(4)
			player_buys = false
			player_response = false
			focus = 'Cafeguest'
			if ! spawned:
				guest()
		else:
			if focus == 'Player':
				$Dialogue/Popup.hide()


func guest():
	var guest = path.instance()
	get_parent().call_deferred("add_child", guest)
	spawned = true


func _on_Area2D_body_entered(body):
	if body.name == 'Player' and body.name == focus:
		_load_dialog(3)
		player_buys = true
	if body.name == 'Cafeguest' and body.name == focus:
		_load_dialog(index)
		$Timer.start(4)


func _on_Timer_timeout():
	if focus == 'Player':
		if index == 2:
			index = 1
	if focus == 'Cafeguest':
			if index == 3:
				index = 1
				focus = 'Player'
	index = index + 1
	_load_dialog(index)
