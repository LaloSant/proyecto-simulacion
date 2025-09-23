'''
	Modulo btn a menu principal
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 02 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa boton a menu principal
'''

class_name btnAMenuPrin extends Button

func _on_pressed() -> void:
	a_menu_prin()
	
func a_menu_prin() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")
