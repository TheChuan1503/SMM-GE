extends CanvasLayer
func _ready() -> void:
	self.hide()
func ok():
	self.hide()
func make(title, desc):
	$ColorRect2/Label.text=title
	$ColorRect2/ColorRect/Label.text=desc
	$ColorRect2/ColorRect/ColorRect/okButton.pressed.connect(ok)
	self.show()
	self.set_layer(1403)
	$AnimationPlayer.play("fadeIn")
	pass
