'''
	Modulo Mundo Exterior
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 26 / 03 / 2025
	Descripcion: Se implementa el nivel del mundo exterior
'''

extends Node2D

var pers:Personaje_2

func _ready() -> void:
	pers = $Personaje
	setPosicionJugador()
	$Personaje/Camera.zoom = Vector2(2.5,2.5)
	$Personaje/HUD/Salud.visible=false
	if not GLOBAL.habla_ocayo:
		$Transiciones/TCEdifAmb.set_deferred("monitoring",false)
	if not GLOBAL.habla_alexis:
		$Transiciones/TCEdifX.set_deferred("monitoring",false)
	pass

func setPosicionJugador() -> void: #Para cuando salga de un edificio o empieze partida
	$Personaje/Lantern.visible = false
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTFuera:
		pers.position = $Marcadores/EdificioTFuera.position
		saleT()
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EPrinFuera:
		pers.position = $Marcadores/EPrincFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioAmbFuera:
		pers.position = $Marcadores/EdificioAmbFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EnsambleFuera:
		pers.position = $Marcadores/EnsambleFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_CristalFuera:
		pers.position = $Marcadores/CristalFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioXFuera:
		pers.position = $Marcadores/EdificioXFuera.position
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioMecaFuera:
		pers.position = $Marcadores/EdificioMecaFuera.position		

func _on_area_2d_body_entered(body: Node2D) -> void:
	transparentar(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	de_transparentar(body)

func transparentar(body:Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		$Transparentar/ANPModulate.play("Fade_Edificios")

func de_transparentar(body:Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		$Transparentar/ANPModulate.play_backwards("Fade_Edificios")

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo()
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true

func _on_tc_edif_t_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTEntrada

func _on_tc_edif_amb_body_entered(body: Node2D) -> void:
	if GLOBAL.habla_ocayo:
		$Transiciones/TCEdifAmb.set_deferred("monitoring",true)
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual= GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada

func _on_tc_ensamble_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EnsambleEntrada

func _on_tc_cristal_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_CristalEntrada

func saleT():
	if !GLOBAL.saleT:
		GLOBAL.saleT = true
		$Dialogo.popup()
		pers.state_change(pers.states.cannot_move)

func _on_dialogo_confirmed() -> void:
	pers.state_change(pers.states.can_move)

func _on_area_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		if GLOBAL.pliego:
			$NPCs/NPC4/DWEntregaDoc.mostrar_dialogo(body)
			GLOBAL.entrega_pliego = true


func _on_tc_edif_meca_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioMecaEntrada


func _on_tc_edif_x_body_entered(body: Node2D) -> void:
	if GLOBAL.habla_alexis:
		$Transiciones/TCEdifX.set_deferred("monitoring",true)
	if body is Personaje or body is Personaje_2:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioXEntrada
