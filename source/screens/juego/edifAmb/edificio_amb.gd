'''
	Modulo Edificio Ambiental
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 22 / 04 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio Ambiental
'''

extends Node2D
var todos_son_true = false

func _ready() -> void:
	if not $Personaje.tiene_8_paginas():
		$Transicion.set_deferred("monitoring",false)
		$Items/DWNeedPaginas.mostrar_dialogo($Personaje)
	$Personaje/HUD/lblInfo.text = "lbl_Salon"
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.65
	$Personaje/Linterna.visible = $Personaje.tieneLampara
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada:
			$Personaje.position = $TpNuevo/Entrada.position
	$Items/item_lampara.visible = !GLOBAL.pers_tieneLampara
	$Enemigos/GuardianP.speed *= 0.8
	$Enemigos/GuardianP2.speed *= 0.8
	$Enemigos/GuardianSalon.speed *= 0.8
	$Enemigos/GuardianSalon2.speed *= 0.8
	$Enemigos/GuardianSalon3.speed *= 0.8
	$Enemigos/GuardianSalon4.speed *= 0.8
	
func _process(delta: float) -> void:
	$Enemigos/GuardianP.actualizarPosChase(delta)
	$Enemigos/GuardianP2.actualizarPosChase(delta)
	$Enemigos/GuardianSalon.actualizarPosChase(delta)
	$Enemigos/GuardianSalon2.actualizarPosChase(delta)
	$Enemigos/GuardianSalon3.actualizarPosChase(delta)
	$Enemigos/GuardianSalon4.actualizarPosChase(delta)

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo($Personaje)
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true

func _on_personaje_fin_muerte() -> void:
	$Musica.playing= false
	$Enemigos/GuardianP/SFX.playing = false

func _on_p_1_pb_tp_body_entered(_body: Node2D) -> void:
	if $Personaje.tiene_8_paginas():
		$Transicion.set_deferred("monitoring",true)

func _on_salon_2_pb_tp_body_entered(_body: Node2D) -> void:
	if $Personaje.tiene_8_paginas():
		$Transicion.set_deferred("monitoring",true)

func _on_salon_8_pb_tp_body_entered(_body: Node2D) -> void:
		if $Personaje.tiene_8_paginas():
			$Transicion.set_deferred("monitoring",true)
