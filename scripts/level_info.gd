extends CanvasLayer
@onready var btn: Panel = $ColorRect2/buttons/Btn
@onready var btn_2: Panel = $ColorRect2/buttons/Btn2
@onready var btn_3: Panel = $ColorRect2/buttons/Btn3
@onready var btn_4: Panel = $ColorRect2/buttons/Btn4
@onready var btn_5: Panel = $ColorRect2/buttons/Btn5

func i18n():
	Global.i18n($ColorRect2/buttons/Btn/Label)
	Global.i18n($ColorRect2/buttons/Btn2/Label)
	Global.i18n($ColorRect2/buttons/Btn3/Label)
	Global.i18n($ColorRect2/buttons/Btn4/Label)
	Global.i18n($ColorRect2/buttons/Btn5/Label)
func close():
	$AudioClose.play()
	self.hide()
func _ready() -> void:
	$ColorRect2/ColorRect/BtnClose.setOnClick(close)
	btn.setDisabled(true)
	btn_3.setDisabled(true)
	btn_4.setDisabled(true)
	btn_5.setDisabled(true)
	self.hide()
func make(name:String,data:Dictionary):
	i18n()
	$ColorRect2/ColorRect/title.text=data['title']
	$ColorRect2/desc.text=data['desc']
	btn_2.setOnClick(play.bind(name))
	self.show()
	self.set_layer(100)
func play(name:String):
	$AudioSelect.play()
	Global.level=name
	SceneChanger.gradient('res://scenes/level_preload.tscn')
	self.hide()
