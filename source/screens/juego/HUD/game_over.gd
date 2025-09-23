'''
	Modulo Gameover
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 19 / 05 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa el HUD de game over
'''

extends CanvasLayer

func _on_btn_continuar_pressed() -> void:
	GLOBAL.continuarPartida(true)

func _on_btn_menu_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")
