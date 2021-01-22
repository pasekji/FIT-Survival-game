extends Node2D

const item_drop = preload("res://src/Inventory/ItemDrop.tscn")

var limit = 15
var key = 0

func _ready():
	BGMusic.change("base")

func _on_CoffeeCupSpawnTimer_timeout():
	if Global.coffee_cups.size() < limit:
		var x = rand_range(0, 4000)
		var y = rand_range(0, 4000)
		var position = Vector2(x,y)
		spawn_coffee(position)


func spawn_coffee(position):
	var coffee_cup = item_drop.instance()
	coffee_cup.item_name = "coffee-cup"
	self.call_deferred("add_child", coffee_cup)
	coffee_cup.global_position = position
	Global.coffee_cups[key] = coffee_cup
	key = key + 1
