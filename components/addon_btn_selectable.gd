extends TextureButton

func setOnClick(fun:Callable):
	pressed.connect(fun)
