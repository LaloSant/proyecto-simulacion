'''
	Modulo item torta
	Creado por: Yael Sampayo Marin
	Modificado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 22 / 05 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa componente de item torta
'''

class_name item_torta extends Area2D
signal item_obtenido

func ready()->void:
	if GLOBAL.torta==true:
		self.visible=false
		self.monitoring=false

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_torta():
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0, -20), 2)
			tween.tween_property(self, "modulate:a", 0.0, 1)
			body.torta = true
			GLOBAL.torta = true
			body.pick_torta()
			emit_signal("item_obtenido")
			tween.tween_callback(self.queue_free)
