extends KinematicBody2D

export(Array, String) var dialog

const item_drop = preload("res://src/Inventory/ItemDrop.tscn")

func _ready():
	$Dialogue/Popup/Panel.set_global_position(Vector2(self.global_position.x-200, self.global_position.y - 200))

func _load_dialog(dialog_index):
	if dialog_index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[dialog_index]
		if Global.ISIC == false:
			spawnISIC()

func spawnISIC():
	var ISIC_instance = item_drop.instance()
	ISIC_instance.item_name = "isic"
	get_parent().call_deferred("add_child", ISIC_instance)
	ISIC_instance.global_position = Vector2(630, 500)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Dialogue/Popup.hide()


func _on_Area2D_body_entered(body):
	if body.name == 'Player' and Global.ISIC == false:
		_load_dialog(0)
	if body.name == 'Player' and Global.ISIC:
		var r = rand_range(1,3)
		_load_dialog(r)
