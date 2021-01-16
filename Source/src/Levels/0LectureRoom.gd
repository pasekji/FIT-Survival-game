extends Node2D
var dialog_index = 0
const item_drop = preload("res://src/Inventory/ItemDrop.tscn")
var next = true
var quest_started = Global.quest_keyboard_started
func _ready():
	$Player.global_position = Vector2(200, 3800)
	hide_all()


func show_choice():
	if dialog_index == 1:
		$CanvasLayer/Question1/Button.text = "Ehm, four?"
		$CanvasLayer/Question1/Button2.text = "Depends on K value"
		$CanvasLayer/Question1/Button3.text = "I am sorry profesor but I got lost. This is not my lesson."
		$CanvasLayer/Question1.show()
	if dialog_index == 2:
		$CanvasLayer/Question1/Button.text = "I want to go home."
		$CanvasLayer/Question1/Button2.text = "I want to find study department."
		$CanvasLayer/Question1/Button3.text = "I would like a coffee."
		$CanvasLayer/Question1.show()

func hide_all():
	$CanvasLayer/Question1.hide()

func q1b1():
	if next:
		hide_all()
		if dialog_index == 1:
			dialog_index = 11
			$Lector.dialogue("Not correct. You should study more!")
			$Lector/TimerLecture.start()
			$Lector.notes_index = randi() % 30
		if dialog_index == 2:
			dialog_index = 21
			$Lector.dialogue("Me too. Press alt+f4!")
		var next = false


# stop lesson and students leave
func q1b2():
	if next:
		hide_all()
		if dialog_index == 1:
			dialog_index = 12
			$Lector.dialogue("You are right! I see that you all understand it perfectly. The lesson is over!")
		if dialog_index == 2:
			dialog_index = 22
			$Lector.dialogue("Find me some keyboard and I will get you admitted. Ok?")
			$Lector/TimerLecture.start()
			$Lector.notes_index = randi() % 30
			hide_all()
			dialog_index = 0
			quest_started = true
			Global.quest_keyboard_started = true
			$Lector.quest_started = true
			$Lector.dialog_index = 0
		var next = false

func q1b3():
	if next == true:
		hide_all()
		if dialog_index == 1:
			dialog_index = 13
			$Lector.dialog_index = 13
			$Lector.dialogue("I feel the same sometimes. What do you need?")
			dialog_index = 2
			show_choice()
			var next = false
			return
		if dialog_index == 2:
			dialog_index = 23
			var current_time = OS.get_time()
			$Lector.dialogue(String(current_time.hour) + ":" + String(current_time.minute) + " is not a bad time to have a coffee. Cheers.")
			spawnBeer()
			hide_all()
			dialog_index = 0
			var next = false

func spawnBeer():
	var beer = item_drop.instance()
	beer.item_name = "coffee"
	beer.global_position = Vector2($Lector.global_position.x + 100, $Lector.global_position.y - 100)
	get_parent().call_deferred("add_child", beer)
	beer.set_scale(Vector2(2, 2))



func _on_Button_mouse_exited():
	next = true


func _on_Button2_mouse_exited():
	next = true


func _on_Button3_mouse_exited():
	next = true
