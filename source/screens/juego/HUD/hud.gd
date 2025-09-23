'''
	Modulo HUD
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 03 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa script de HUD
'''

class_name HUD extends CanvasLayer

func _ready() -> void:
	$PanelMisiones.visible = false
	consultarMisiones()
	actTorta()

func actualizar_salud(salud) -> void:
	var stage = (salud / 10) + 1 
	stage = 10 if stage == 11 else stage
	$Salud.frame = stage - 1
	if salud == 100:
		$Salud.frame = 10
	$Salud/ANPSalud.play("danio")
	
func mostrarMisiones():
	consultarMisiones()
	var tween = create_tween()
	if $PanelMisiones.visible: 
		tween.tween_property($PanelMisiones, "position", Vector2(574, -413), 0.5).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(0.5).timeout
	else:
		tween.tween_property($PanelMisiones, "position", Vector2(574, 0), 0.5).set_ease(Tween.EASE_IN)
	$PanelMisiones.visible = !$PanelMisiones.visible

func consultarMisiones():
	$PanelMisiones/TickNaranjas.visible = GLOBAL.otorgar_naranjas
	$PanelMisiones/TickPliego.visible = GLOBAL.pliego
	setNumPaginas()

func setNumPaginas():
	var numPaginas = 0
	for tienePagina in GLOBAL.paginas:
		if tienePagina:
			numPaginas += 1
	$PanelMisiones/lblNumPaginas.text = str(numPaginas) + " / 8"
	if numPaginas == 8:
		$PanelMisiones/TickPaginas.visible = true

func cambioTorta(valor:bool) -> void:
	GLOBAL.torta = valor
	var tween = create_tween()
	var color = Color(1, 1, 1, 1) if valor else Color(0, 0, 0, 1)
	tween.tween_property($Torta, "modulate", color, 1.0)

func actTorta():
	$Torta.modulate = Color(1, 1, 1, 1) if GLOBAL.torta else Color(0, 0, 0, 1)
