'''
	Modulo item pagina
	Creado por: Yael Sampayo Marin
	Fecha de creacion: 12 / 05 / 2025
	Fecha de ultima modificacion: 25 / 05 / 2025
	Descripcion: Se implementa componente de item pagina
'''

class_name Pagina extends Area2D
signal item_obtenido
@export var num_pagina:int

func _ready() -> void:
	if GLOBAL.paginas.get(num_pagina):
		self.visible= false
		self.monitoring = false

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_pagina_x(num_pagina):
			body.set_pagina_x(num_pagina)
			var tween = create_tween()
			tween.tween_property(self, "position", position + Vector2(0, -20), 0.7)
			tween.tween_property(self, "modulate:a", 0.0, 1)
			emit_signal("item_obtenido")
			GLOBAL.paginas.set(num_pagina, true)
			body.pick_pag(num_pagina)
			tween.tween_callback(self.queue_free)
