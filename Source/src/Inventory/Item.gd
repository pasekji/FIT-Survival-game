extends Node2D

var item_name
var item_quantity
var item_description = ''


func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)


func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://graphics/icons/" + item_name + ".png")
	
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_description = JsonData.item_data[item_name]["Description"]
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = String(item_quantity)

func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)


func _on_TextureRect_mouse_entered():
	$Description.show()


func _on_TextureRect_mouse_exited():
	$Description.hide()
