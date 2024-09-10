extends TextureButton

func setOnClick(fun:Callable):
	pressed.connect(fun)


func _on_mouse_entered() -> void:
	pass # Replace with function body.
