extends CanvasLayer
func i18n():
	Global.i18n($ColorRect2/ColorRect/Label)
	Global.i18n($ColorRect2/okBtn/Label)
	Global.i18n($ColorRect2/ColorRect2/BtnCredits/Label)
func _ready() -> void:
	i18n()
	$ColorRect2/okBtn.setOnClick(hide)
	$ColorRect2/ColorRect2/BtnGithub.setOnClick(OS.shell_open.bind('https://github.com/TheChuan1503/SMM-GE'))
	$ColorRect2/ColorRect2/BtnCredits.setOnClick(SceneChanger.gradient.bind('res://scenes/credits_scene.tscn'))
	self.hide()
func make():
	self.show()
	self.set_layer(1403)
	pass
