'''
	Modulo Edificio X
	Creado por: Yael Sampayo Marin
	Modificado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 22 / 04 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio X
'''

extends Node2D

func _ready() -> void:
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioXEntrada:
		$Personaje.position = $Markers/Entrada.position
	$Items/ItemNaranjas.visible= !GLOBAL.naranjas
	$Items/ItemNaranjas.monitorable=!GLOBAL.naranjas
	$Items/ItemTorta.visible= !GLOBAL.torta
	$Items/ItemTorta.monitorable=!GLOBAL.torta
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.65
	$Enemigos/Guardia1.speed *= 1.5
	$Enemigos/Guardia2.speed *= 1
	
func _process(delta: float) -> void:
	$Enemigos/Guardia1.actualizarPosChase(delta)
	$Enemigos/Guardia2.actualizarPosChase(delta)

func _on_personaje_fin_muerte() -> void:
	$Musica.playing= false
	$Enemigos/Guardia1/SFX.playing = false
	$Enemigos/Guardia2/SFX.playing = false
