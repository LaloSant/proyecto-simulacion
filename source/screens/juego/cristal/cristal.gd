'''
	Modulo Edificio Cristal
	Creado por: Yael Sampayo Marin
	Modificado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 19 / 05 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio Cristal
'''

extends Node2D

func _ready() -> void:
	$Personaje.defaultSpeed = GLOBAL.pers_default_speed * 0.5
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_CristalEntrada:
			$Personaje.position = $Markers/Cristal.position
	if not GLOBAL.pliego:
		$Items/DWEntrada.mostrar_dialogo($Personaje)
	#if not $Personaje.has_lamp():
		#$Items/DWNeedLampara.mostrar_dialogo($Personaje)
	$Personaje/Linterna.visible = false
	$Items/ItemReconocimiento.visible = !GLOBAL.pliego
	$Items/ItemReconocimiento.monitorable = !GLOBAL.pliego

func _on_item_reconocimiento_item_obtenido() -> void:
	GLOBAL.pliego = true
	$Items/DWRecoje.mostrar_dialogo($Personaje)
