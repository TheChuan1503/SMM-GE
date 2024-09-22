extends Panel
@onready var text: Label = $text
@onready var panel: Panel = $"."
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func temp(fun:Callable):
	text["label_settings"]["font_color"]=Global.COLOR_YELLOW
	panel["theme_override_styles/panel"]["bg_color"]=Global.COLOR_RED
	audio_stream_player.play()
	MainMenu.hide()
	fun.call()

func setOnClick(fun:Callable):
	$Play_Action1.setOnClick(temp.bind(fun))
