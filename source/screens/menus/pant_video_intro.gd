'''
	Modulo Pantalla Video Intro
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 11 / 03 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa la pantalla del video introductorio del juego.
'''

extends Node2D

func _ready() -> void:
	$btn_A_Pant_Intro.grab_focus()

func _on_video_stream_player_finished() -> void:
	salir_a_menu()

func _on_btn_a_pant_intro_pressed() -> void:
	salir_a_menu()
	
func salir_a_menu():
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_intro.tscn")
