'''
	Modulo Config
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2025
	Fecha de ultima modificacion: 24 / 03 / 2025
	Descripcion: Se implementa singleton de configuracion
'''

extends Node

var file_path = "res://config.cfg" if OS.get_name() == "Windows" else "user://config.cfg"
var config = ConfigFile.new()

func _ready() -> void:
	if !FileAccess.file_exists(file_path):
		#Seccion Lenguaje
		config.set_value("Lenguaje", "lengua_activa", "es")
		
		#Seccion Personaje
		config.set_value("Personaje", "default_speed", 150)
		config.set_value("Personaje", "maxHealth", 100)
		config.set_value("Personaje", "currentHealth", 100)
		config.set_value("Personaje", "baseDamage", 10)
		config.set_value("Personaje", "lowAguaLoca", 20)
		config.set_value("Personaje", "highAguaLoca", 50)
		config.set_value("Personaje", "factorSneak", 0.75)
		config.set_value("Personaje", "factorRun", 1.5)
		config.set_value("Personaje", "nombre", "Lalo")
		config.set_value("Personaje", "tieneLampara", false)
		config.set_value("Personaje","pliego",false)
		config.set_value("Personaje","contTactiles",false)
		config.set_value("Personaje","naranjas",false)
		config.set_value("Personaje","torta",false)
		config.set_value("Personaje","otorgar_naranjas",false)
		config.set_value("Personaje","otorgar_torta",false)

		#Seccion audio
		config.set_value("Audio", "master", 1)
		config.set_value("Audio", "musica", 1)
		config.set_value("Audio", "sfx", 1)
		config.set_value("Audio", "voz", 1)
		config.save(file_path)
	else:
		config.load(file_path)

func save_full_config():
	config.save(file_path)

#Seccion Lenguaje	
func save_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)
	config.save(file_path)

func update_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)
	
func load_lenguaje_setting():
	var lenguaje_settings = {}
	for key in config.get_section_keys("Lenguaje"):
		lenguaje_settings[key]=config.get_value("Lenguaje", key)
	return lenguaje_settings

#Seccion personaje	
func save_personaje_setting(key:String, value):
	config.set_value("Personaje", key, value)
	config.save(file_path)

func update_personaje_setting(key:String, value):
	config.set_value("Personaje", key, value)
	
func load_personaje_setting():
	var personaje_settings = {}
	for key in config.get_section_keys("Personaje"):
		personaje_settings[key]=config.get_value("Personaje", key)
	return personaje_settings

#Seccion audio
func save_audio_setting(key:String, value):
	config.set_value("Audio", key, value)
	config.save(file_path)

func update_audio_setting(key:String, value):
	config.set_value("Audio", key, value)
	
func load_audio_setting():
	var personaje_settings = {}
	for key in config.get_section_keys("Audio"):
		personaje_settings[key]=config.get_value("Audio", key)
	return personaje_settings
