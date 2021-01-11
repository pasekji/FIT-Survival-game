extends KinematicBody2D

const SPEED = 1000
var ISIC = false
var movedir = Vector2(0,0)
var spritedir = "down"

func hasIsic() -> bool:
	return ISIC

func _ready():
	self.global_position = Global.player_initial_map_position
	

func _physics_process(_delta):
		controls_loop()
		movement_loop()
		spritedir_loop()
		
		if movedir != Vector2(0,0):
			anim_switch("walk")
		else:
			anim_switch("idle")
		
func controls_loop():
	var LEFT	=	Input.is_action_pressed("ui_left")
	var RIGHT	=	Input.is_action_pressed("ui_right")
	var UP		=	Input.is_action_pressed("ui_up")
	var DOWN	=	Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)

#	UNUSED
# func _zoom(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if event.button_index == BUTTON_WHEEL_UP:
#				if $Camera2D.zoom > Vector2(0.1, 0.1):
#					$Camera2D.zoom = $Camera2D.zoom - Vector2(0.05, 0.05)
#				
#			elif event.button_index == BUTTON_WHEEL_DOWN:
#				if $Camera2D.zoom < Vector2(0.75, 0.75):
#					$Camera2D.zoom = $Camera2D.zoom + Vector2(0.05, 0.05)
					
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir="left"
		Vector2(1,0):
			spritedir="right"
		Vector2(0,-1):
			spritedir="up"
		Vector2(0,1):
			spritedir="down"

func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)


func _on_ISIC_body_entered(body: Area2D):
	print(body)
	ISIC = true
