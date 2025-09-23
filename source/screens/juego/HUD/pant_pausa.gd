'''
	Modulo pantalla pausa
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 14 / 05 / 2025
	Fecha de ultima modificacion: 14 / 05 / 2025
	Descripcion: Se implementa escena de pantalla pausa
'''

class_name PantPausa extends CanvasLayer
var pausaSFX = preload("res://resources/audio/pausa.mp3")
var pausaExitSFX = preload("res://resources/audio/pausaExit.mp3")
var pausaGuardar = preload("res://resources/audio/WiiClick.mp3")
var on_pause:bool

func _ready() -> void:
	$contenedor/Continuar/btnContinuar.grab_focus()

func _on_btn_continuar_pressed() -> void:
	procesar()

func _on_btn_guardar_pressed() -> void:
	$SFX.stream = pausaGuardar
	$SFX.play()
	GLOBAL.guardarPartida()

func _on_btn_menu_prin_pressed() -> void:
	procesar()
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")

func procesar():
	if !on_pause:
		get_tree().paused=!get_tree().paused
		$contenedor.visible = !$contenedor.visible
	on_pause = !on_pause
	var sonido = pausaSFX if on_pause else pausaExitSFX
	$SFX.stream = sonido
	if on_pause:
		$ANPPausa.play("Start")
		$contenedor/Continuar/btnContinuar.grab_focus()
		$SFX.play()
	else:
		$ANPPausa.play_backwards("Start")
		$SFX.play()
		await get_tree().create_timer(0.7).timeout
		$contenedor.visible = !$contenedor.visible
		get_tree().paused=!get_tree().paused
