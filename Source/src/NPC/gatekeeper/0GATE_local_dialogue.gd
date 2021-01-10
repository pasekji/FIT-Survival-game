extends Control

export(Array, String) var dialog

const ISIC = preload("res://src/Function Objects/ISIC.tscn")

func _load_dialog(dialog_index):
	if dialog_index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[dialog_index]
		if Global.ISIC == false:
			spawnISIC()

func spawnISIC():
	var ISIC_instance = ISIC.instance()
	ISIC_instance.name = "instancted ISIC"
	add_child(ISIC_instance)
	ISIC_instance.position = Vector2(115, -150)
	ISIC_instance.set_scale(Vector2(0.5, 0.5))

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Popup.hide()
	pass


func _on_Area2D_body_entered(body):
	if body.name == 'Player' and Global.ISIC == false:
		_load_dialog(0)
	if body.name == 'Player' and Global.ISIC:
		var r = rand_range(1,3)
		_load_dialog(r)
