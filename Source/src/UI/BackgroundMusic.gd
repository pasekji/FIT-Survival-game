extends AudioStreamPlayer

# change the track
var changed = false
# start lowering volume
var fade_out = true

# fade in to this value
var hi_th = -10.0
# fade out to this value
var lo_th = -30.0
# step in volume in/decrease
var step = 3.0

var new_track
var timer
func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_Timer_timeout") 
	add_child(timer)

func change(name):
	changed = true
	if name == 'main':
		volume_db = -30.0
		new_track = load("res://music/BoxCat Games - Inspiration.ogg")
		lo_th = -30.0
		hi_th = -10.0
	if name == 'end':
		new_track = load("res://music/BoxCat Games - Epic Song.ogg")
		print(fade_out)
		print(volume_db)
		print(changed)
		volume_db = -40.0
		lo_th = -30.0
		hi_th = -10.0
	if name == 'base':
		volume_db = -30.0
		lo_th = -30.0
		hi_th = -20.0
		new_track = load("res://music/BoxCat Games - Map Theme.ogg")
	if name == 'cafe':
		lo_th = -30.0
		hi_th = -25.0
		new_track = load("res://music/BoxCat Games - Passing Time.ogg")
	if name == 'title':
		volume_db = -30.0
		lo_th = -30.0
		hi_th = -10.0
		new_track = load("res://music/BoxCat-Games-Nameless_-the-Hackers-Title-Screen.ogg")
	timer.start(0.1)

func quiet():
	volume_db = -150.0

func _on_Timer_timeout():
	if volume_db > lo_th and fade_out:
		volume_db -= step
	else:
		fade_out = false
		if changed == false and volume_db > hi_th:
			timer.stop()
			fade_out = true
		if changed:
			stream = new_track
			self.play()
			changed = false
		volume_db += step
