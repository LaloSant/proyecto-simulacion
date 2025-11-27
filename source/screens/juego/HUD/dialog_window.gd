'''
	Modulo dialog window
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 07 / 03 / 2025
	Fecha de ultima modificacion: 07 / 03 / 2025
	Descripcion: Se implementa componente de dialog window
'''

class_name DialogWindow extends CanvasLayer
@export var persona:String
@export var texto:String
@export var sound:AudioStream
@export var tiempo:int
@onready var lblTexto = $PnlTexto/lbl_texto
@onready var lblPersona = $PnlTexto2/lbl_persona
var pers:Personaje
var pers2_0:Personaje_2

func _ready() -> void:
	$PnlTexto2/lbl_persona.text = persona
	$PnlTexto/lbl_texto.text = texto
	$ASP.stream = sound
	$Timer1.wait_time = tiempo
	layer =-5

func actualizaTexto() -> void:
	lblPersona.text = persona
	lblTexto.text = texto

func mostrar_dialogo(body):
	
	if body is Personaje:
		pers = body
		pers.puedeMoverse = false
	else:
		pers2_0 = body
		pers2_0.state_change(pers2_0.states.cannot_move)
	actualizaTexto()
	lblTexto.visible_characters = 0
	layer = 1
	$ASP.play()
	var tiempoL = lblTexto.get_total_character_count() * 0.05
	var tween = create_tween()
	tween.tween_property(lblTexto, "visible_characters", lblTexto.get_total_character_count(), tiempoL)
	$Timer1.start()

func _on_timer_timeout() -> void:
	var tiempoL = lblTexto.get_total_character_count() * 0.05
	$Timer2.wait_time = tiempoL
	var tween = create_tween()
	tween.tween_property(lblTexto, "visible_characters", 0, tiempoL)
	$Timer2.start()

func _on_timer_2_timeout() -> void:
	if pers is Personaje:
		pers.puedeMoverse = true
	else:
		pers2_0.state_change(pers2_0.states.can_move)
	layer = -5
