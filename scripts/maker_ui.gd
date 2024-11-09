extends CanvasLayer

@onready var btn_coursebot: Panel = $Panel/ColorRect/BtnCoursebot
@onready var btn_eraser: Panel = $Panel/ColorRect2/BtnEraser
@onready var coursebot_audio_open: AudioStreamPlayer = $Panel/ColorRect/BtnCoursebot/audioOpen
@onready var item_card_1: Panel = $Panel2/ColorRect/ItemCard1
@onready var item_card_2: Panel = $Panel2/ColorRect/ItemCard2
@onready var item_card_3: Panel = $Panel2/ColorRect/ItemCard3
@onready var item_card_4: Panel = $Panel2/ColorRect/ItemCard4
@onready var item_card_5: Panel = $Panel2/ColorRect/ItemCard5
@onready var item_card_6: Panel = $Panel2/ColorRect/ItemCard6
@onready var item_card_7: Panel = $Panel2/ColorRect/ItemCard7
@onready var item_card_8: Panel = $Panel2/ColorRect/ItemCard8
@onready var item_card_9: Panel = $Panel2/ColorRect/ItemCard9
@onready var item_card_10: Panel = $Panel2/ColorRect/ItemCard10
@onready var item_card_11: Panel = $Panel2/ColorRect/ItemCard11
@onready var item_card_12: Panel = $Panel2/ColorRect/ItemCard12
@onready var coursebotPanelLabel: Label = $coursebotPanel/header/Label
@onready var coursebot_panel: Panel = $coursebotPanel
@onready var coursebotAnimationPlayer: AnimationPlayer = $coursebotPanel/AnimationPlayer
@onready var coursebot_audio_close: AudioStreamPlayer = $Panel/ColorRect/BtnCoursebot/audioClose

var coursebotOpened := false

func i18n():
	Global.i18n(coursebotPanelLabel)
func _ready() -> void:
	i18n()
	MakerStatus.init()
	btn_eraser.setOnClick(eraser)
	btn_coursebot.setOnClick(coursebot)
	item_card_1.setObject('block_soil')
	item_card_2.setObject('block_brick')
	item_card_3.setObject('item_coin')
	item_card_4.setObject('block_ice')
	pass # Replace with function body.

func eraser():
	get_parent().setState('eraser')
	MakerStatus.isEraser = not MakerStatus.isEraser
func coursebot():
	coursebotOpened=!coursebotOpened
	coursebot_panel.visible=coursebotOpened
	if coursebotOpened:
		coursebot_audio_open.play()
		coursebotAnimationPlayer.play('slideOut')
		#btn_coursebot["theme_override_styles/panel"]["bg_color"]=Global.COLOR_RED
	else:
		coursebot_audio_close.play()
		coursebotAnimationPlayer.play('RESET')
		btn_coursebot["theme_override_styles/panel"]["bg_color"]=Color.WHITE
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
