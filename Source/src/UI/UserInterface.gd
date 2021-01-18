extends CanvasLayer

var bodies = {}

func _ready():
	pass


func _process(_delta):
	if bodies.size() > 0 and Input.is_action_just_pressed("ui_accept"):
		$InstructionsTalk.hide()


func _input(event):
	if event.is_action_pressed("inventory"):
		$Inventory.visible = !$Inventory.visible
		$Inventory.initialize_inventory()


func _on_TalkArea_body_entered(body):
	if body.name != 'gatekeeper':
		bodies[body] = body
		$InstructionsTalk.show()


func _on_TalkArea_body_exited(body):
	if body.name != 'gatekeeper':
		
		if bodies.size() > 0 and bodies.size() != 1:
			bodies.erase(body)
		else:
			$InstructionsTalk.hide()
