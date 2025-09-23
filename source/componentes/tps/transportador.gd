'''
	Modulo Teletransportador
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 26 / 03 / 2025
	Fecha de ultima modificacion: 27 / 05 / 2025
	Descripcion: Se implementa componente de teletransportador
'''

extends Area2D
@export var destino:Marker2D
signal cambio_lugar

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if body.muerto:
			return
		$CooldownPersonaje.start()
		body.setPuedeMoverse(false)
		await SCN_CIRCULAR_FADE.playPt1()
		body.position = destino.position
		emit_signal("cambio_lugar")
		SCN_CIRCULAR_FADE.playPt2()
		await $CooldownPersonaje.timeout
		body.setPuedeMoverse(true)
