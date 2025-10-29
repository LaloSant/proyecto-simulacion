class_name Personaje_2 extends CharacterBody2D

@export_enum("Alan", "Lalo", "Yael")
var character_name:String
var default_speed:int = 100 #GLOBAL.pers_default_speed
var speed_multiplier:float = 1
var last_animation:String

enum states {can_move, is_dead}
var state = states.can_move

func _ready() -> void:
	set_sprite()

func _physics_process(_delta: float) -> void:
	if state == states.is_dead:
		return
	var x = Input.get_axis("ui_left", "ui_right")
	var y = Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(x, y)
	if direction == Vector2.ZERO:
		update_anim(direction)
		return
	direction.normalized()
	velocity = direction * default_speed * speed_multiplier
	update_anim(direction)
	move_and_slide()

func update_anim(direction):
	var move_hor = (direction.x != 0)
	var move_ver = (direction.y != 0)
	if (move_hor and move_ver) or move_hor:
		$AnSprite.play("walk_hor")
		$AnSprite.flip_h = direction.x < 0
	elif move_ver:
		var anim = "walk_down" if direction.y > 0 else "walk_up"
		$AnSprite.play(anim)
	else:
		var last_anim = $AnSprite.animation
		var sufix = last_anim.split("_", true, 1)[1]
		$AnSprite.play("idle_" + sufix)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("CntlKey") or event.is_action_pressed("Control_B_Circ"):
		speed_multiplier = 0.75
	elif event.is_action_pressed("ShiftKey") or event.is_action_pressed("Control_L3"):
		speed_multiplier = 1.2
	if event.is_action_released("CntlKey") or event.is_action_released("Control_B_Circ") or event.is_action_released("ShiftKey") or event.is_action_released("Control_L3"):
		speed_multiplier = 1
	$AnSprite.speed_scale = speed_multiplier
	
func set_sprite():
	var recurso:Resource
	match(character_name):
		"Alan":
			recurso = preload("res://source/componentes/personajes/alan/alanSpritesNew.tres")
		"Lalo":
			recurso = preload("res://source/componentes/personajes/lalo/laloSpritesNew.tres")
		"Yael":
			recurso = preload("res://source/componentes/personajes/yael/yaelSpritesNew.tres")
	$AnSprite.set_sprite_frames(recurso)
