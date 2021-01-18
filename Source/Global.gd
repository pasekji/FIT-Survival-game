extends Node

var player_initial_map_position = Vector2(1400, 1000)
var cleaner_initial_map_position = Vector2(1200, 1000)
var ISIC = false
var coffee_cups = {}
var cups10 = false
var keyboard = false
var quest_keyboard_started = false
var backup_keys = false
var start_time = null
var dist = 0
var restart = false
func _ready():
	start_time = OS.get_time()

func restartGame():
	player_initial_map_position = Vector2(1400, 1000)
	cleaner_initial_map_position = Vector2(1200, 1000)
	ISIC = false
	coffee_cups = {}
	cups10 = false
	keyboard = false
	quest_keyboard_started = false
	backup_keys = false
	start_time = null
	dist = 0
	#var nodes = get_parent().get_children()
	#for i in nodes.size():
	#	print(nodes[i].queue_free())
	get_tree().change_scene("res://src/Levels/0Gate.tscn")
	restart = false
	PlayerInventory.inventory = {}
