'''
	Modulo thread loader
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 21 / 05 / 2025
	Fecha de ultima modificacion: 21 / 05 / 2025
	Descripcion: Se implementa el nivel del thread loader
'''

extends Node
var scene
var scene_path:String

var thread = Thread.new()

func load_trigger(sp:String):
	if thread.is_alive() or thread.is_started():
		return
	scene_path = sp
	thread.start(load_scene)

func load_scene():
	scene = ResourceLoader.load(scene_path)

func get_scene() -> PackedScene:
	return scene
