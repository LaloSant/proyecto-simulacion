'''
	Modulo Edificio T
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 06 / 03 / 2025
	Descripcion: Se implementa el nivel del edificio T
'''

extends Node2D


func _ready() -> void:
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.65
	
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTSalon:
		$Personaje.position = $TpNuevo/Salon.position
		$Personaje/HUD/lblInfo.text = "lbl_Salon"
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTEntrada:
		$Personaje.position = $TpNuevo/Entrada.position
		$Personaje/HUD/lblInfo.text = "lbl_Pb"

func _on_salon_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_p_1_salon_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Salon"

func _on_p_1_pb_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Pb"

func _on_pb_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_personaje_fin_muerte() -> void:
	$Musica.playing = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		if $Personaje.tiene_8_paginas():
			$DWOcayoThanks.mostrar_dialogo(body)
			GLOBAL.tienePaginas =true
			$Personaje/HUD.setNumPaginas()
		else:
			GLOBAL.habla_ocayo =true
			$DWOcayo.mostrar_dialogo(body)
