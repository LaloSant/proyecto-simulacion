'''
	Modulo dialog window
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 07 / 03 / 2025
	Fecha de ultima modificacion: 07 / 03 / 2025
	Descripcion: Se implementa componente de dialog window
'''

class_name DialogWindow extends CanvasLayer
@export var texto:String
@export var sound:AudioStream
@export var tiempo:int
@onready var lblTexto = $PnlTexto/lbl_texto
var pers:Personaje

func _ready() -> void:
	$PnlTexto/lbl_texto.text = texto
	$ASP.stream = sound
	$Timer1.wait_time = tiempo
	layer =-5

func actualizaTexto() -> void:
	lblTexto.text = texto

func mostrar_dialogo(body:Personaje):
	pers = body
	pers.puedeMoverse = false
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
	pers.puedeMoverse = true
	layer = -5
