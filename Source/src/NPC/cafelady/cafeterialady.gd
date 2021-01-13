extends KinematicBody2D

export(Array, String) var dialog

func _ready():
	_load_dialog(0)

func _load_dialog(dialog_index):
	if dialog_index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[dialog_index]

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Dialogue/Popup.hide()

