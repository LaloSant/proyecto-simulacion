'''
	Modulo btn guardar partida
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 02 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa boton para guardar partida
'''

class_name btnGuardarPartida extends Button

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_pressed()

func _on_pressed() -> void:
	GLOBAL.guardarPartida()
