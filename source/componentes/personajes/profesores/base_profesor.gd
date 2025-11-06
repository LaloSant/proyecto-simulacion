class_name Profesor extends CharacterBody2D

@export_enum("Alma", "Maribel", "Ocayo") var character_name:String
@export var ruta_follow:PathFollow2D
@export var markers_aleatorios:Node
@export var region:NavigationRegion2D
var marcadores:Array[Marker2D]
var marker_a_seguir:Marker2D
@onready var agente:NavigationAgent2D = $Agente
var puede_moverse = true

var speed:int = 40 #GLOBAL prof_speed
var posicion_ant:Vector2 = position
var current_anim:String

func _ready() -> void:
	set_sprite()
	if !markers_aleatorios == null:
		for marker in markers_aleatorios.get_children():
			marcadores.append(marker)
		actualizar_objetivo()

func _process(delta: float) -> void:
	if !puede_moverse:
		return
	if marker_a_seguir == null:
		ruta_follow.progress += speed * delta
		actualizar_anim()

func _physics_process(_delta: float) -> void:
	if !puede_moverse:
		return
	if marker_a_seguir != null:
		agente.target_position = marker_a_seguir.global_position
		velocity = global_position.direction_to(agente.get_next_path_position()) * speed
		actualizar_anim()
		move_and_slide()

func actualizar_anim():
	if !puede_moverse:
		$AnSprite.play("idle_hor")
		return
	var anim:String
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

func actualizar_objetivo():
	marker_a_seguir = marcadores[randi() % marcadores.size()]
	agente.target_position = marker_a_seguir.position
	print("Objetivo: " + str(marker_a_seguir))
	puede_moverse = false
	await get_tree().create_timer(3).timeout
	puede_moverse = true
	

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


func _on_agente_target_reached() -> void:
	actualizar_objetivo()
