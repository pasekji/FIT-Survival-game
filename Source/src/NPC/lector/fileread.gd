extends Node2D

onready var text_file = 'res://src/NPC/lector/notes.txt'
var text = {}

func _ready():
	load_file(text_file)

func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 0
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		text[index] = line
		index += 1
	f.close()
	return
