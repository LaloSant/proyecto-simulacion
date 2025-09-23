'''
	Modulo Enemigo base
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 9 / 04 / 2025
	Fecha de ultima modificacion: 9 / 04 / 2025
	Descripcion: Se implementa la logica del enmigo base.
'''

class_name Enemigo extends CharacterBody2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D
@export var tipo:String = GLOBAL.enem_tipo
var spriteSet:Resource
var speed:float = 50
var posicionAnt:Vector2 = position
var currentAnim:String
var salud:int = 50
var muerto:bool = false

func _physics_process(_delta: float) -> void:
	if muerto:
		return
	if target_to_chase != null:
		navigation_agent.target_position = target_to_chase.global_position
		velocity = global_position.direction_to(navigation_agent.get_next_path_position())* speed
		move_and_slide()

func _ready() -> void:
	spriteSet = getSpritePorNombre(tipo)
	cambiarSprite(spriteSet)

func cambiarSprite(spriteSetNew:Resource) -> void:
	$Sprite.set_sprite_frames(spriteSetNew)

func getSpritePorNombre(nom:String) -> Resource:
	match(nom):
		"Guardia":
			return preload("res://source/componentes/personajes/enemigos/police/policeSprites.tres")
		"Fantasma":
			return preload("res://source/componentes/personajes/enemigos/Ghost girl/ghostSprites.tres")
	return preload("res://source/componentes/personajes/enemigos/police/policeSprites.tres")

func actualizarPos(ruta:PathFollow2D, delta:float):
	if muerto:
		return
	var anim:String
	ruta.progress += speed * delta
	var difx = position.x - posicionAnt.x
	var dify = position.y - posicionAnt.y
	var difMayorX = (abs(difx) - abs(dify)) > 0 
	if difMayorX:
		anim = "caminar_der" if difx > 0 else "caminar_izq"
	else:
		anim = "caminar_abj" if dify > 0 else "caminar_arr"
	$Sprite.play(anim)
	currentAnim = anim
	posicionAnt = position
	
func actualizarPosChase(_delta:float):
	if muerto:
		return
	var anim:String
	var difx = position.x - posicionAnt.x
	var dify = position.y - posicionAnt.y
	var difMayorX = (abs(difx) - abs(dify)) > 0 
	if difMayorX:
		anim = "caminar_der" if difx > 0 else "caminar_izq"
	else:
		anim = "caminar_abj" if dify > 0 else "caminar_arr"
	$Sprite.play(anim)
	currentAnim = anim
	posicionAnt = position

func _on_area_danio_body_entered(body: Node2D) -> void:
	if muerto:
		return
	if body is Personaje:
		if body.muerto or !body.puedeMoverse:
			return
		var desdeX:int
		var desdeY:int
		match currentAnim:
			"caminar_der":
				desdeX = 1
			"caminar_izq":
				desdeX = -1
			"caminar_abj":
				desdeY = 1
			"caminar_arr":
				desdeY = -1
		body.recibe_danio(10, desdeX, desdeY)

func _on_hurt_box_damage_received() -> void:
	if tipo == "Fantasma":
		return
	salud -= 10
	if salud <= 0:
		if not muerto:
			$SFX.stream = preload("res://resources/audio/toma-don-ramon.mp3")
			$SFX	.play()
		muerto = true
		$Sprite.animation = "muerto"
	else:
		danio()

func danio():
	$SFX.stream = preload("res://resources/audio/SteveHUrt.mp3")
	$SFX.play()
	$ANPEnemigo.play("hurt")
