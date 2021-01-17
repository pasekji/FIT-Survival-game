extends Control

export(Array, String) var dialog


func _load_dialog(dialog_index):
	if dialog_index < dialog.size():
		$Popup.show()
		$Popup/Panel/RichTextLabel.text = dialog[dialog_index]

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Popup.hide()
	pass


func _ready():
	if Global.ISIC == false:
		_load_dialog(0)
	if Global.ISIC:
		var r = rand_range(1,4)
		_load_dialog(r)
