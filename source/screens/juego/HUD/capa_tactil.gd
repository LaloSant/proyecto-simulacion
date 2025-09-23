'''
	Modulo Capa tactil
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 19 / 05 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa el HUD de capa tactil
'''

class_name CapaTactil extends CanvasLayer

func _ready() -> void:
	if !GLOBAL.controles_tactiles:
		$Contenedor.visible = false
		toogle_btns(false)
	else:
		$Contenedor.visible = true
		toogle_btns(true)

func toogle_btns(valor:bool):
	$Contenedor/Pad/PadArr.set_block_signals(valor)
	$Contenedor/Pad/PadAbj.set_block_signals(valor)
	$Contenedor/Pad/PadDer.set_block_signals(valor)
	$Contenedor/Pad/PadIzq.set_block_signals(valor)
	$Contenedor/Botones/A.set_block_signals(valor)
	$Contenedor/Botones/B.set_block_signals(valor)
	$Contenedor/Botones/X.set_block_signals(valor)
	$Contenedor/Botones/Y.set_block_signals(valor)
	$Contenedor/Control/LB.set_block_signals(valor)
	$Contenedor/Control/LT.set_block_signals(valor)
	$Contenedor/Control/RB.set_block_signals(valor)
	$Contenedor/Control/RT.set_block_signals(valor)
	$Contenedor/Triggers/Back.set_block_signals(valor)
	$Contenedor/Triggers/Start.set_block_signals(valor)
