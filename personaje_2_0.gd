class_name monigote extends CharacterBody2D

var character_name:String
var default_speed:int = 150 
var speed_multiplier:float = 1

func _physics_process(delta: float) -> void:
	var x = Input.get_axis("ui_left", "ui_right")
	var y = Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(x, y)
	if direction == Vector2.ZERO:
		return
	direction.normalized()
	velocity = direction * default_speed * speed_multiplier
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("CntlKey") or event.is_action_pressed("Control_B_Circ"):
		speed_multiplier = 0.75
	elif event.is_action_pressed("ShiftKey") or event.is_action_pressed("Control_L3"):
		speed_multiplier = 1.2
	if event.is_action_released("CntlKey") or event.is_action_released("Control_B_Circ") or event.is_action_released("ShiftKey") or event.is_action_released("Control_L3"):
		speed_multiplier = 1
