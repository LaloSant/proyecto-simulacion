'''
	Modulo Ensamble
	Creado por: Yael Sampayo Marin
	Modificado por:
	Fecha de creacion: 14 / 04 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio de Ensamble
'''

extends Node2D

func _ready() -> void:
	$Personaje/Linterna.visible = false
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EnsambleEntrada:
			$Personaje.position = $Ensamble.position

func _on_tp_body_entered(_body: Node2D) -> void:
	if GLOBAL.pers_nombre == "Yael":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Lalo"))
		GLOBAL.pers_nombre = "Lalo"
	elif GLOBAL.pers_nombre== "Lalo":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Alan"))
		GLOBAL.pers_nombre = "Alan"
	elif GLOBAL.pers_nombre == "Alan":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Yael"))
		GLOBAL.pers_nombre = "Yael"
		
func _on_cambiador_body_entered(_body: Node2D) -> void:
	if GLOBAL.pers_nombre == "Yael":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Lalo"))
	elif GLOBAL.pers_nombre== "Lalo":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Alan"))
	elif GLOBAL.pers_nombre == "Alan":
				$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Yael"))
	
