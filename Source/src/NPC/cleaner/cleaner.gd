extends KinematicBody2D

const ACCELERATION = 460
const MAX_SPEED = 800
var velocity = Vector2.ZERO
export (String) var item_name 
export (Vector2) var scene_position = Vector2.ZERO
export(Array, String) var dialog
var key = 0
var being_picked_up = false
var goal = null
var player_dialogue_index = 1

func _ready():
	#self.global_position = Global.cleaner_initial_map_position
	self.global_position = scene_position
	

func _physics_process(_delta):
	pickup()
	if goal:
		if is_instance_valid(goal):
			var direction = global_position.direction_to(goal.global_position)
			velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION)
			velocity = move_and_slide(velocity, Vector2.UP)
			$Dialogue/Popup/Panel.set_global_position(self.global_position)


func select_goal():
	var goals = Global.coffee_cups.keys()
	if goals.size() > 0:
		var goal = Global.coffee_cups[goals[0]]
		Global.coffee_cups.erase(goals[0])
		return goal

func pickup():
	if $PickUpArea.items_in_range.size() > 0:
		var pickup_item = $PickUpArea.items_in_range.values()[0]
		pickup_item.pick_up_item(self, true)
		dialogue(rand_range(1,3))
		$PickUpArea.items_in_range.erase(pickup_item)


func _on_Timer_timeout():
	if is_instance_valid(goal) == false && goal == null:
		goal = select_goal()


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		player_dialogue_index = player_dialogue_index + 1
		dialogue(player_dialogue_index)


func dialogue(index):
	if index < dialog.size():
		$Dialogue/Popup.show()
		$Dialogue/Popup/Panel/RichTextLabel.text = dialog[index]
	else:
		$Dialogue/Popup.hide()

