'''
	Modulo PantConfig
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 19 / 02 / 2024
	Fecha de ultima modificacion: 23 / 03 / 2024
	Descripcion: Se implementa la pantalla de configuracion del juego
'''

extends Node2D

func _ready() -> void:
	$Panel/HBox/VButtons/btn_controles.text = 'btn_controlesAct' if GLOBAL.controles_tactiles else 'btn_controlesDes'
	$Panel/HBox/VButtons/slider_master.set_value_no_signal(GLOBAL.nivelAudioMaster)
	$Panel/HBox/VButtons/slider_musica.set_value_no_signal(GLOBAL.nivelAudioMusica)
	$Panel/HBox/VButtons/slider_sfx.set_value_no_signal(GLOBAL.nivelAudioSFX)
	$Panel/HBox/VButtons/slider_voz.set_value_no_signal(GLOBAL.nivelAudioVoz)
	if !SAVEFILE.existe_partida():
		$Panel/HBoxBtn/btn_eliminarPart.disabled = true
	$Panel/HBoxBtn/btn_guardar.grab_focus()

func _on_btn_pant_principal_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")

func _on_btn_idioma_pressed() -> void:
	language_control()

func language_control() -> void:
	var language_settings = CONFIG_FILE.load_lenguaje_setting()
	var al=language_settings.lengua_activa
	match (al):
		"es":
			al = "en"
		"en":
			al = "fr"
		"fr":
			al = "es"
	CONFIG_FILE.update_lenguaje_setting("lengua_activa", al)
	TranslationServer.set_locale(al)

func _on_btn_guardar_idioma_pressed() -> void:
	CONFIG_FILE.save_full_config()

func _on_slider_master_value_changed(value: float) -> void:
	GLOBAL.nivelAudioMaster = value
	GLOBAL.cambiar_bus_audio(GLOBAL.audioMaster, value)
	CONFIG_FILE.update_audio_setting("master", value)

func _on_slider_musica_value_changed(value: float) -> void:
	GLOBAL.nivelAudioMusica = value
	GLOBAL.cambiar_bus_audio(GLOBAL.audioMusica, value)
	CONFIG_FILE.update_audio_setting("musica", value)

func _on_slider_sfx_value_changed(value: float) -> void:
	GLOBAL.nivelAudioSFX = value
	GLOBAL.cambiar_bus_audio(GLOBAL.audioSFX, value)
	CONFIG_FILE.update_audio_setting("sfx", value)

func _on_slider_voz_value_changed(value: float) -> void:
	GLOBAL.nivelAudioVoz = value
	GLOBAL.cambiar_bus_audio(GLOBAL.audioVoz, value)
	CONFIG_FILE.update_audio_setting("voz", value)

func _on_btn_eliminar_part_pressed() -> void:
	SAVEFILE.elimina_partida()
	if !SAVEFILE.existe_partida():
		$Panel/HBoxBtn/btn_eliminarPart.disabled = true

func _on_btn_controles_pressed() -> void:
	GLOBAL.controles_tactiles = !GLOBAL.controles_tactiles
	$Panel/HBox/VButtons/btn_controles.text = 'btn_controlesAct' if GLOBAL.controles_tactiles else 'btn_controlesDes'
