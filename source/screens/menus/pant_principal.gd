'''
	Modulo PantPrincipal
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 17 / 02 / 2025
	Fecha de ultima modificacion: 23 / 03 / 2025
	Descripcion: Se implementa la pantalla principal del juego.
'''

extends Node2D

func _ready() -> void:
	$Panel/VBoxContainer/btn_iniciar.grab_focus()
	$Panel/VBoxContainer/btn_continuar.disabled = !SAVEFILE.existe_partida()
	THR_LOADER.load_trigger("res://source/screens/menus/pant_creditos.tscn")

func _on_btn_iniciar_pressed() -> void:
	GLOBAL.continuar_partida = false
	GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTSalon
	GLOBAL.naranjas = false
	GLOBAL.otorgar_naranjas = false
	GLOBAL.torta = false
	GLOBAL.saleT = false
	GLOBAL.pliego = false
	GLOBAL.paginas = [false, false, false, false, false, false, false, false]
	SCN_FADE_IN.cambia_escena("res://source/screens/juego/edifT/edificio_t.tscn")

func _on_btn_continuar_pressed() -> void:
	GLOBAL.continuarPartida(false)

func _on_btn_config_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_config.tscn")

func _on_btn_creditos_pressed() -> void:
	SCN_FADE_IN.cambia_escena_packed(THR_LOADER.get_scene())
	#SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_creditos.tscn")

func _on_btn_salir_pressed() -> void:
	get_tree().quit()
	
func _on_timer_video_intro_timeout() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_video_intro.tscn")
