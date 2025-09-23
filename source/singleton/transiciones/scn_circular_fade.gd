'''
	Modulo scn transition circular fade
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 10 / 03 / 2025
	Fecha de ultima modificacion: 24 / 03 / 2025
	Descripcion: Se implementa pantalla de transicion circular fade in
'''

extends CanvasLayer

func _ready() -> void:
	layer = -1

func cambia_escena(path:String) -> void:
	layer = 1
	$ANPCFade.play("Circular_Fade")
	await($ANPCFade.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPCFade.play_backwards("Circular_Fade")
	await($ANPCFade.animation_finished)
	layer = -1

func playPt1() -> void:
	layer = 1
	$ANPCFade.play("Circular_Fade")
	await($ANPCFade.animation_finished)

func playPt2() -> void:
	$ANPCFade.play_backwards("Circular_Fade")
	await($ANPCFade.animation_finished)
	layer = -1
