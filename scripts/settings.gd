extends CanvasLayer
func i18n():
	Global.i18n($ColorRect2/ColorRect/Label)
	Global.i18n($ColorRect2/okBtn/Label)
func _ready() -> void:
	i18n()
	$ColorRect2/okBtn.setOnClick(hide)
	self.hide()
func make():
	self.show()
	self.set_layer(1403)
	pass
