'''
	Modulo scn transition fade in
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 10 / 03 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa pantalla de transicion fade in
'''

extends CanvasLayer

func _ready() -> void:
	layer = -1

func cambia_escena(path:String) -> void:
	layer = 1
	$ANPFade.play("Fade_in")
	await($ANPFade.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPFade.play_backwards("Fade_in")
	await($ANPFade.animation_finished)
	layer = -1

func cambia_escena_packed(scene:PackedScene) -> void:
	layer = 1
	$ANPFade.play("Fade_in")
	await($ANPFade.animation_finished)
	get_tree().change_scene_to_packed(scene)
	$ANPFade.play_backwards("Fade_in")
	await($ANPFade.animation_finished)
	layer = -1
