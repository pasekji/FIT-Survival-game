extends Control

export(Array, String) var dialog

var dialog_index = 0
const ISIC = preload("res://src/Function Objects/ISIC.tscn")

func _load_dialog():
	if dialog_index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[dialog_index]
		dialog_index += 1
	else:
		$Popup.hide()
		if Global.ISIC == false:
			var ISIC_instance = ISIC.instance()
			ISIC_instance.name = "instancted ISIC"
			add_child(ISIC_instance)
			ISIC_instance.position = Vector2(115, -150)
			ISIC_instance.set_scale(Vector2(0.5, 0.5))

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		_load_dialog()
	pass


func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		_load_dialog()
	pass
