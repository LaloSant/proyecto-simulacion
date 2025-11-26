'''
	Modulo item libros
	Creado por: Yael Sampayo Marin
	Fecha de creacion: 22 / 05 / 2025
	Fecha de ultima modificacion: 22 / 05 / 2025
	Descripcion: Se implementa componente de item libros
'''

class_name item_libro extends Area2D

signal item_obtenido

func ready()->void:
	if GLOBAL.libros==true:
		self.visible=false
		self.monitoring=false

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_naranjas():
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0, -20), 0.7)
			tween.tween_property(self, "modulate:a", 0.0, 1)
			body.libros = true
			GLOBAL.libros = true
			body.pick_naranjas()
			emit_signal("item_obtenido")
			tween.tween_callback(self.queue_free)
