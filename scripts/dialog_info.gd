extends CanvasLayer
func _ready() -> void:
	self.hide()
func ok(cb:Callable):
	cb.bind()
	self.hide()
func make(title, desc, callback:Callable = _ready):
	$ColorRect2/Label.text=title
	$ColorRect2/ColorRect/Label.text=desc
	$ColorRect2/ColorRect/ColorRect/okButton.pressed.connect(ok.bind(callback))
	self.show()
	self.set_layer(1403)
	$AnimationPlayer.play("fadeIn")
	pass
