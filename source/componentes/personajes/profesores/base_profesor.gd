class_name Profesor extends CharacterBody2D

@export_enum("Alma", "Maribel", "Ocayo")
var character_name:String
@export
var ruta_follow:PathFollow2D

var speed:int = 40 #GLOBAL prof_speed
var posicion_ant:Vector2 = position
var current_anim:String

func _ready() -> void:
	set_sprite()

func _process(delta: float) -> void:
	actualizar_pos(delta)

func actualizar_pos(delta:float):
	var anim:String
	ruta_follow.progress += speed * delta
	var difx = position.x - posicion_ant.x
	var dify = position.y - posicion_ant.y
	var difMayorX = (abs(difx) - abs(dify)) > 0 
	if difMayorX:
		anim = "walk_hor" 
		$AnSprite.flip_h = difx < 0
	else:
		anim = "walk_down" if dify > 0 else "walk_up"
	$AnSprite.play(anim)
	current_anim = anim
	posicion_ant = position

func set_sprite():
	var recurso:Resource
	match(character_name):
		"Alma":
			recurso = preload("res://source/componentes/personajes/profesores/base_profesores.tres")
		"Maribel":
			recurso = preload("res://source/componentes/personajes/profesores/base_profesores.tres")
		"Ocayo":
			recurso = preload("res://source/componentes/personajes/profesores/base_profesores.tres")
	$AnSprite.set_sprite_frames(recurso)
