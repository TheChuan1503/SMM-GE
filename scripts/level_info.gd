extends CanvasLayer

func i18n():
	Global.i18n($ColorRect2/buttons/Btn/Label)
	Global.i18n($ColorRect2/buttons/Btn2/Label)
	Global.i18n($ColorRect2/buttons/Btn3/Label)
	Global.i18n($ColorRect2/buttons/Btn4/Label)
	Global.i18n($ColorRect2/buttons/Btn5/Label)

func _ready() -> void:
	$ColorRect2/ColorRect/BtnClose.setOnClick(self.hide)
	$ColorRect2/buttons/Btn.setDisabled(true)
	$ColorRect2/buttons/Btn3.setDisabled(true)
	$ColorRect2/buttons/Btn4.setDisabled(true)
	$ColorRect2/buttons/Btn5.setDisabled(true)
	self.hide()
func make(data:Dictionary):
	i18n()
	$ColorRect2/ColorRect/title.text=data['title']
	$ColorRect2/desc.text=data['desc']
	self.show()
	self.set_layer(100)
