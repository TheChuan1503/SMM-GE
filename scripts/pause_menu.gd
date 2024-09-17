extends CanvasLayer
func i18n():
	#Global.i18n($ColorRect2/ColorRect3/makerOption/text)
	#Global.i18n($ColorRect2/ColorRect3/worldOption/text)
	#Global.i18n($ColorRect2/ColorRect3/challengeOption/text)
	#Global.i18n($ColorRect2/ColorRect3/coursebotOption/text)
	pass

var opened=false

func exit():
	self.opened=false
	SceneChanger.gradient('res://scenes/title_scene.tscn')
	self.hide()
func _ready() -> void:
	i18n()
	$ColorRect2/ColorRect4/BtnSmall.setOnClick(exit)
	self.hide()
	pass
func _process(delta: float) -> void:
	if PauseMenu.opened and Global.scene == 'game':
		if Input.is_action_pressed("pause"):
			get_tree().paused=false
			opened=false
			close()
func initDisabled():
	#$ColorRect2/ColorRect3/coursebotOption/text["label_settings"]["font_color"]=Global.COLOR_RED
	#$ColorRect2/ColorRect3/coursebotOption["theme_override_styles/panel"]["bg_color"]=Color.WHITE
	#var sc = Global.scene
	#var willBeDisabled
	#var willBeDisabledText
	#if sc == 'coursebot':
		#willBeDisabled=$ColorRect2/ColorRect3/coursebotOption
		#willBeDisabledText=$ColorRect2/ColorRect3/coursebotOption/text
	#
	#willBeDisabledText["label_settings"]["font_color"]=Global.COLOR_YELLOW
	#willBeDisabled["theme_override_styles/panel"]["bg_color"]=Global.COLOR_RED
	pass

func make():
	self.opened=true
	$audioOpen.play()
	initDisabled()
	self.show()
	self.set_layer(1403)
	pass
func close():
	$audioClose.play()
	get_tree().paused=false
	self.opened=false
	self.hide()

func _on_texture_button_pressed() -> void:
	close()
	pass # Replace with function body.