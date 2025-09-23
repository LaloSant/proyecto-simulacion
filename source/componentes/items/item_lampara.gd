'''
	Modulo item lampara
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 07 / 03 / 2025
	Fecha de ultima modificacion: 07 / 03 / 2025
	Descripcion: Se implementa componente de item lampara
'''

class_name itemLampara extends Area2D
signal item_obtenido

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_lamp():
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0, -20), 0.7)
			tween.tween_property(self, "modulate:a", 0.0, 1)
			body.tieneLampara = true
			GLOBAL.pers_tieneLampara = true
			emit_signal("item_obtenido")
			tween.tween_callback(self.queue_free)
