'''
	Modulo Mundo Exterior
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 26 / 03 / 2025
	Descripcion: Se implementa el nivel del mundo exterior
'''

extends Node2D

func _ready() -> void:
	setPosicionJugador()
	$Personaje/camara.zoom = Vector2(2.5,2.5)

func setPosicionJugador() -> void: #Para cuando salga de un edificio o empieze partida
	$Personaje/Linterna.visible = false
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTFuera:
		$Personaje.position = $Marcadores/EdificioTFuera.position
		saleT()
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EPrinFuera:
		$Personaje.position = $Marcadores/EPrincFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioAmbFuera:
		$Personaje.position = $Marcadores/EdificioAmbFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EnsambleFuera:
		$Personaje.position = $Marcadores/EnsambleFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_CristalFuera:
		$Personaje.position = $Marcadores/CristalFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioXFuera:
		$Personaje.position = $Marcadores/EdificioXFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioMecaFuera:
		$Personaje.position = $Marcadores/EdificioMecaFuera.position		

func _on_area_2d_body_entered(body: Node2D) -> void:
	transparentar(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	de_transparentar(body)

func transparentar(body:Node2D) -> void:
	if body is Personaje:
		$Transparentar/ANPModulate.play("Fade_Edificios")

func de_transparentar(body:Node2D) -> void:
	if body is Personaje:
		$Transparentar/ANPModulate.play_backwards("Fade_Edificios")

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo()
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true

func _on_tc_edif_t_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTEntrada

func _on_tc_edif_amb_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual= GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada

func _on_tc_ensamble_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EnsambleEntrada

func _on_tc_cristal_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_CristalEntrada

func saleT():
	if !GLOBAL.saleT:
		GLOBAL.saleT = true
		$Dialogo.popup()
		$Personaje.puedeMoverse = false

func _on_dialogo_confirmed() -> void:
	$Personaje.puedeMoverse = true
