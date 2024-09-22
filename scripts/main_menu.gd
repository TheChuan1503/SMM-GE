extends CanvasLayer
@onready var btn_settings: Panel = $ColorRect2/ColorRect4/BtnSettings
@onready var btn_exit: Panel = $ColorRect2/ColorRect4/BtnExit

@onready var maker_option: Panel = $ColorRect2/ColorRect3/makerOption

func i18n():
	Global.i18n($ColorRect2/ColorRect3/makerOption/text)
	Global.i18n($ColorRect2/ColorRect3/worldOption/text)
	Global.i18n($ColorRect2/ColorRect3/challengeOption/text)
	Global.i18n($ColorRect2/ColorRect3/coursebotOption/text)

var opened=false

func exit():
	self.opened=false
	SceneChanger.gradient('res://scenes/title_scene.tscn')
	self.hide()
func _ready() -> void:
	i18n()
	btn_exit.setOnClick(exit)
	btn_settings.setOnClick(Settings.make)
	maker_option.setOnClick(SceneChanger.gradient.bind('res://scenes/maker.tscn'))
	self.hide()
	pass
func initDisabled():
	$ColorRect2/ColorRect3/coursebotOption/text["label_settings"]["font_color"]=Global.COLOR_RED
	$ColorRect2/ColorRect3/coursebotOption["theme_override_styles/panel"]["bg_color"]=Color.WHITE
	var sc = Global.scene
	var willBeDisabled
	var willBeDisabledText
	if sc == 'coursebot':
		willBeDisabled=$ColorRect2/ColorRect3/coursebotOption
		willBeDisabledText=$ColorRect2/ColorRect3/coursebotOption/text
	
	willBeDisabledText["label_settings"]["font_color"]=Global.COLOR_YELLOW
	willBeDisabled["theme_override_styles/panel"]["bg_color"]=Global.COLOR_RED

func make():
	self.opened=true
	$audioOpen.play()
	initDisabled()
	self.show()
	self.set_layer(1403)
	pass


func _on_texture_button_pressed() -> void:
	$audioClose.play()
	self.hide()
	pass # Replace with function body.
