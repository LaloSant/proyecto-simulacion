'''
	Modulo Save File
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 14 / 05 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa singleton de save file
'''

extends Node2D

var file_path = "user://gamsesave.json" if OS.get_name() == "Android" or OS.get_name()== "macOS" else "res://gamesave.json"

func salva_partida():
	var datos = {
		"salud": GLOBAL.pers_salud,
		"pers_tieneLampara": GLOBAL.pers_tieneLampara,
		"paginas": GLOBAL.paginas,
		"contadorDia": GLOBAL.contador_dia,
		"markerActual": GLOBAL.marker_actual,
		"escenaActual": GLOBAL.escena_actual,
		"nombre": GLOBAL.pers_nombre,
		"pliego": GLOBAL.pliego,
		"entrega_pliego": GLOBAL.entrega_pliego,
		"libros":GLOBAL.libros,
		"torta":GLOBAL.torta,
		"otorgar_libro":GLOBAL.otorgar_libro,
		"tienePaginas":GLOBAL.tienePaginas,
		"habla_ocayo":GLOBAL.habla_ocayo,
		"habla_alexis":GLOBAL.habla_alexis
	}
	var jsonString = JSON.stringify(datos)
	if !FileAccess.file_exists(file_path):
		pass
	var jsonFile = FileAccess.open(file_path, FileAccess.WRITE)
	jsonFile.store_line(jsonString)
	jsonFile.close()

func carga_partida():
	if !FileAccess.file_exists(file_path):
		return false
	var jsonFile = FileAccess.open(file_path, FileAccess.READ)
	var jsonString=jsonFile.get_as_text()
	jsonFile.close()
	var datos=JSON.parse_string(jsonString)
	GLOBAL.pers_salud = datos.salud
	GLOBAL.pers_tieneLampara =datos.pers_tieneLampara
	GLOBAL.pliego = datos.pliego
	GLOBAL.entrega_pliego = datos.entrega_pliego
	GLOBAL.libros = datos.libros
	GLOBAL.torta = datos.torta
	GLOBAL.otorgar_libro = datos.otorgar_libro
	GLOBAL.tienePaginas = datos.tienePaginas
	var contador:int = 0
	for pag in datos.paginas:
		GLOBAL.paginas.set(contador, pag)
		contador += 1
	GLOBAL.set("paginas", datos.paginas)
	GLOBAL.contador_dia = datos.contadorDia
	GLOBAL.marker_actual = datos.markerActual
	GLOBAL.escena_actual = datos.escenaActual
	GLOBAL.pers_nombre = datos.nombre
	GLOBAL.habla_alexis = datos.habla_alexis
	GLOBAL.habla_ocayo = datos.habla_ocayo

func elimina_partida():
	if FileAccess.file_exists(file_path):
		DirAccess.remove_absolute(file_path)
		
func existe_partida() -> bool:
	return FileAccess.file_exists(file_path)
