extends CanvasLayer

func _ready() -> void:
	self.hide()
	pass

func make():
	self.show()
	self.set_layer(1403)
	pass


func _on_texture_button_pressed() -> void:
	self.hide()
	pass # Replace with function body.
