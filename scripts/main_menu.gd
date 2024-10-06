extends CanvasLayer
@onready var btn_settings: Panel = $ColorRect2/ColorRect4/BtnSettings
@onready var btn_exit: Panel = $ColorRect2/ColorRect4/BtnExit

@onready var maker_option: Panel = $ColorRect2/ColorRect3/makerOption
@onready var coursebot_option: Panel = $ColorRect2/ColorRect3/coursebotOption

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
	maker_option.setOnClick(SceneChanger.gradient.bind('res://scenes/maker.tscn'))
	coursebot_option.setOnClick(SceneChanger.gradient.bind('res://scenes/coursebot_scene.tscn'))
	i18n()
	btn_exit.setOnClick(exit)
	btn_settings.setOnClick(Settings.make)
	self.hide()
	pass
func initDisabled():
	$ColorRect2/ColorRect3/coursebotOption/text["label_settings"]["font_color"]=Global.COLOR_RED
	coursebot_option["theme_override_styles/panel"]["bg_color"]=Color.WHITE
	$ColorRect2/ColorRect3/makerOption/text["label_settings"]["font_color"]=Global.COLOR_RED
	maker_option["theme_override_styles/panel"]["bg_color"]=Color.WHITE
	var sc = Global.scene
	var willBeDisabled
	var willBeDisabledText
	if sc == 'coursebot':
		willBeDisabled=coursebot_option
		willBeDisabledText=$ColorRect2/ColorRect3/coursebotOption/text
	if Global.isMaker:
		willBeDisabled=maker_option
		willBeDisabledText=$ColorRect2/ColorRect3/makerOption/text
	#willBeDisabled.setOnClick(nothing)
	willBeDisabledText["label_settings"]["font_color"]=Global.COLOR_YELLOW
	willBeDisabled["theme_override_styles/panel"]["bg_color"]=Global.COLOR_RED

func make():
	LevelInfo.hide()
	self.opened=true
	$audioOpen.play()
	initDisabled()
	self.show()
	self.set_layer(1403)
	pass

func nothing():
	pass
func _on_texture_button_pressed() -> void:
	$audioClose.play()
	self.hide()
	pass # Replace with function body.
