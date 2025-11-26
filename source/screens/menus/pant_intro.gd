'''
	Modulo Pantalla Intro
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 11 / 03 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa la pantalla introductoria del juego.
'''

extends Node2D

func _ready() -> void:
	$Panel/btn_AMenuPrin.grab_focus()
