extends Control

export(Array, String) var dialog

const ISIC = preload("res://src/Function Objects/ISIC.tscn")
var index = 0

func _load_dialog():
	if index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[index]
	else:
		$Popup.hide()

