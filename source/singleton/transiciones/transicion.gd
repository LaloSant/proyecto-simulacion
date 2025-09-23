'''
	Modulo Transicionador
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 26 / 03 / 2025
	Fecha de ultima modificacion: 26 / 03 / 2025
	Descripcion: Se implementa componente de transicionador
'''

class_name transicion extends Area2D
@export var escena:String
@export var puntoSalida:String

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if body.muerto:
			return
		body.setPuedeMoverse(false)
		defPuntoSalida() 
		await SCN_FADE_IN.cambia_escena(escena)

func defPuntoSalida() -> void:
	match puntoSalida:
		"mk_EdificioTEntrada":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTEntrada
		"mk_EdificioTFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTFuera
		"mk_EPrinFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EPrinFuera
		"mk_EdificioAmbFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioAmbFuera
		"mk_EnsambleFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EnsambleFuera
		"mk_EdificioAmbEntrada":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada
		"mk_CristalFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_CristalFuera
		"mk_CristalEntrada":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_CristalEntrada
		"mk_EdificioXFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioXFuera
		"mk_EdificioXEntrada":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioXEntrada
		"mk_EdificioMecaFuera":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioMecaFuera
		"mk_EdificioMecaEntrada":
			GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioMecaEntrada
