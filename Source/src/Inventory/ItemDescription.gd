extends Label


func _on_TextureRect_mouse_entered():
	var item_name = get_parent().item_name
	print(item_name)
	self.text = JsonData.item_data[item_name]["Description"]

