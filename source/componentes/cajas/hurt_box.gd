'''
	Modulo HUD
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 07 / 05 / 2025
	Fecha de ultima modificacion: 07 / 05 / 2025
	Descripcion: Se implementa script de Hit box
'''

class_name Hurtbox extends Area2D
signal damage_received


func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		emit_signal("damage_received")
