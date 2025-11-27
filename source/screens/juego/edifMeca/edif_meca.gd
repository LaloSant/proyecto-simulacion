'''
	Modulo Edificio Meca
	Creado por: Yael Sampayo Marin
	Modificado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 22 / 04 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio Meca
'''

extends Node2D

func _ready() -> void:
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EdificioMecaEntrada:
			$Personaje.position = $Markers/Entrada.position
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.5

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Personaje or body is Personaje_2:
		if GLOBAL.libros:
			$Npc/DWAlexisThanks.mostrar_dialogo(body)
			GLOBAL.otorgar_libro = true
			body.entrega_naranjas()
		else:
			GLOBAL.habla_alexis=true
			$Npc/DWAlexisNeed.mostrar_dialogo(body)
