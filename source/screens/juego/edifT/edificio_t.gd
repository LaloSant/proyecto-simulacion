'''
	Modulo Edificio T
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 06 / 03 / 2025
	Descripcion: Se implementa el nivel del edificio T
'''

extends Node2D
@onready var ruta_Pasillo_F = $Rutas/RtaPasillo/RtaFPasillo

func _ready() -> void:
	if not $Personaje.has_lamp():
		$Items/DWNeedLampara.mostrar_dialogo($Personaje)
		$Items/item_lampara.visible = true
	$Personaje/Linterna.visible = $Personaje.tieneLampara
	$Items/item_lampara.visible = !$Personaje.has_lamp()
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.65
	
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTSalon:
		$Personaje.position = $TpNuevo/Salon.position
		$Personaje/HUD/lblInfo.text = "lbl_Salon"
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTEntrada:
		$Personaje.position = $TpNuevo/Entrada.position
		$Personaje/HUD/lblInfo.text = "lbl_Pb"

	
func _process(delta: float) -> void:
	$Enemigos/GuardianP.actualizarPos($Rutas/RtaPasillo/RtaFPasillo, delta)

func _on_salon_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_p_1_salon_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Salon"

func _on_p_1_pb_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Pb"

func _on_pb_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo($Personaje)
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true

func _on_personaje_fin_muerte() -> void:
	$Musica.playing = false
	$Enemigos/GuardianP/SFX.playing = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Personaje:
		$DWOcayo.mostrar_dialogo(body)
