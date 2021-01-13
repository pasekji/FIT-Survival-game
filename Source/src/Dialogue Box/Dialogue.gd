extends Control

export(Array, String) var dialog

const ISIC = preload("res://src/Function Objects/ISIC.tscn")

func _load_dialog(index):
	if index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[index]
		index += 1
	else:
		$Popup.hide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		var index = 1
		_load_dialog(index)


func _on_PickUpArea_body_entered(body):
	var r = rand_range(1,3)
	_load_dialog(r)
