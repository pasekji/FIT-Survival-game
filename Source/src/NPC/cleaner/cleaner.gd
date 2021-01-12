extends KinematicBody2D

const ACCELERATION = 460
const MAX_SPEED = 225
var velocity = Vector2.ZERO
export (String) var item_name 
var trash = null
var being_picked_up = false
const item_drop = preload("res://src/Inventory/ItemDrop.tscn")

func _ready():
	#self.global_position = Global.cleaner_initial_map_position
	self.global_position = Vector2(800, 300)
	spawn_coffee()

func _physics_process(_delta):
	trash = pickup()
	if trash:
		var direction = global_position.direction_to(trash.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION)
		var distance = global_position.distance_to(trash.global_position)
		if distance < 4:
			$PickUpArea.items_in_range.erase(trash)
			trash.clean_itself()
		velocity = move_and_slide(velocity, Vector2.UP)

func spawn_coffee():
	var coffee_cup = item_drop.instance()
	coffee_cup.item_name = "coffee-cup"
	get_parent().call_deferred("add_child", coffee_cup)
	trash = coffee_cup
	coffee_cup.global_position = Vector2(800, 800)


func pickup():
	if $PickUpArea.items_in_range.size() > 0:
		var pickup_item = $PickUpArea.items_in_range.values()[0]
		pickup_item.pick_up_item(self, false)
		return pickup_item
