extends Node2D

func onStartClick  () -> void:
	$CanvasLayer/TextureButton.visible=false
	$CanvasLayer/TextureButton2.visible=true
func onMakeClick():
	SceneChanger.gradient('res://scenes/maker_scene.tscn')
	#DialogInfo.make('wo shi lao CHUAN','CHUAN ge zhi zao, hui ji quan qiu (bushi')
func onPlayClick():
	DialogInfo.make('Info','The current PLAY is unavailable')

func _ready() -> void:
	
	$CanvasLayer/Label2.visible=true
	$CanvasLayer/TextureButton2.visible=false
	$CanvasLayer/TextureButton/startButton.pressed.connect(onStartClick)
	$CanvasLayer/TextureButton2/ItemAction.pressed.connect(onMakeClick)
	$CanvasLayer/TextureButton2/ItemAction2.pressed.connect(onPlayClick)
	pass

func _process(delta: float) -> void:
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
	pass
