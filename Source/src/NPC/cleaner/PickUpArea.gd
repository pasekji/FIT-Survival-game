extends Area2D

var items_in_range = {}


func _on_PickUpArea_body_entered(body):
	print(body.item_name)
	if body.item_name == "coffee-cup":
		items_in_range[body] = body
