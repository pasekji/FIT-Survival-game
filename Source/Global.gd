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

func _ready():
	start_time = OS.get_time()
