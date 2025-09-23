'''
	Modulo PantConfig
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 02 / 2024
	Fecha de ultima modificacion: 24 / 02 / 2024
	Descripcion: Se implementa la pantalla de creditos
'''

extends Node2D

func _ready() -> void:
	$Panel/btn_AMenuPrin.grab_focus()

func _on_video_stream_player_finished() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")
