'''
	Modulo item pliego
	Creado por: Yael Sampayo Marin
	Fecha de creacion: 22 / 05 / 2025
	Fecha de ultima modificacion: 22 / 05 / 2025
	Descripcion: Se implementa componente de item pliego
'''

class_name item_pliego extends Area2D

signal item_obtenido

func ready()->void:
	if GLOBAL.pliego==true:
		self.visible=false
		self.monitoring=false

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_pliego():
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0, -20), 0.7)
			tween.tween_property(self, "modulate:a", 0.0, 1)
			body.pliego = true
			GLOBAL.pliego = true
			body.pick_pliego()
			emit_signal("item_obtenido")
			tween.tween_callback(self.queue_free)
