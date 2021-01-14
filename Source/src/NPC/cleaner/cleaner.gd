extends KinematicBody2D

const ACCELERATION = 460
const MAX_SPEED = 800
var velocity = Vector2.ZERO
export (String) var item_name 
export (Vector2) var scene_position = Vector2.ZERO
export(Array, String) var dialog
const item_drop = preload("res://src/Inventory/ItemDrop.tscn")

var key = 0
var being_picked_up = false
var goal = null
var speaking = false
var player_dialogue_index = 2
var quest_dialogue = 4

func _ready():
	self.global_position = scene_position
	

func _physics_process(_delta):
	pickup()
	if ! speaking:
		if goal:
			if is_instance_valid(goal):
				var direction = global_position.direction_to(goal.global_position)
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION)
				velocity = move_and_slide(velocity, Vector2.UP)
				$Dialogue/Popup/Panel.set_global_position(self.global_position)


func select_goal():
	var goals = Global.coffee_cups.keys()
	if goals.size() > 0:
		var goal2 = Global.coffee_cups[goals[0]]
		Global.coffee_cups.erase(goals[0])
		return goal2

func pickup():
	if $PickUpArea.items_in_range.size() > 0:
		var pickup_item = $PickUpArea.items_in_range.values()[0]
		pickup_item.pick_up_item(self, true)
		if ! speaking:
			dialogue(rand_range(0,3))
		$PickUpArea.items_in_range.erase(pickup_item)


func _on_Timer_timeout():
	if is_instance_valid(goal) == false && goal == null:
		goal = select_goal()


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and speaking:
		dialogue(player_dialogue_index)
		player_dialogue_index = player_dialogue_index + 1
		if player_dialogue_index > 3:
			player_dialogue_index = 2
		


func dialogue(index):
	if index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[index]
	else:
		$Dialogue/Popup.hide()

func questFinish():
	$QuestAwardTimer.start()
	
	

func start_dialogue(_body):
	speaking = true
	if Global.cups10 == true:
		questFinish()

func end_dialogue(_body):
	speaking = false


func _on_QuestAwardTimer_timeout():
	dialogue(quest_dialogue)
	quest_dialogue = quest_dialogue + 1
	if quest_dialogue == 8:
		spawnAward()
		speaking = false
		$QuestAwardTimer.stop()
		
func spawnAward():
	var award = item_drop.instance()
	award.item_name = "backup-keys"
	award.global_position = Vector2(self.global_position.x + 100, self.global_position.y - 100)
	get_parent().call_deferred("add_child", award)
	award.set_scale(Vector2(0.5, 0.5))
