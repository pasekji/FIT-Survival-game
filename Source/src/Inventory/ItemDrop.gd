extends KinematicBody2D

const ACCELERATION = 8000
const MAX_SPEED = 500
var velocity = Vector2.ZERO
export (String) var item_name 
var player = null
var being_picked_up = false

func _ready():
	$Sprite.texture = load("res://graphics/icons/" + item_name + ".png")
	if Global.keyboard and item_name == "keyboard":
		queue_free()
	
func _physics_process(delta):
	if being_picked_up == true:
		if item_name == 'isic':
			Global.ISIC = true
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		var distance = global_position.distance_to(player.global_position)
		if distance < 100:
			if player.name == "Player":
				PlayerInventory.add_item(item_name, 1)
			queue_free()
		velocity = move_and_slide(velocity, Vector2.UP)

func pick_up_item(body, condition):
	if body.name == 'Player':
		if $AudioStreamPlayer2D:
			$AudioStreamPlayer2D.play()
	player = body
	being_picked_up = condition
