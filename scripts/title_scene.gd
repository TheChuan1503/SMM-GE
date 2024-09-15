extends Node2D

func notAvailable():
	DialogInfo.make('Info','This action is unavailable')
func onStartClick  () -> void:
	$CanvasLayer/TextureButton.visible=false
	$CanvasLayer/TextureButton2.visible=true
func onMakeClick():
	#SceneChanger.gradient('res://scenes/maker_scene.tscn')
	DialogInfo.make('Info','The current MAKER is unavailable')
	#DialogInfo.make('wo shi lao CHUAN','CHUAN ge zhi zao, hui ji quan qiu (bushi')
func onPlayClick():
	$CanvasLayer/panelPlay.visible=true
	$CanvasLayer/playBack.visible=true
	$CanvasLayer/TextureButton2.visible=false
	#SceneChanger.gradient('res://test/test_game.tscn')
	pass
func onPlayBackClick():
	$CanvasLayer/panelPlay.visible=false
	$CanvasLayer/playBack.visible=false
	$CanvasLayer/TextureButton2.visible=true
func onPlayAction1Click():
	SceneChanger.gradient('res://test/test_game.tscn')
func onPlayAction3Click():
	SceneChanger.gradient('res://scenes/coursebot_scene.tscn')

func _ready() -> void:
	$CanvasLayer/Label2.visible=true
	$CanvasLayer/panelPlay.visible=false
	$CanvasLayer/TextureButton2.visible=false
	$CanvasLayer/TextureButton/startButton.pressed.connect(onStartClick)
	$CanvasLayer/TextureButton2/ItemAction.pressed.connect(onMakeClick)
	$CanvasLayer/TextureButton2/ItemAction2.pressed.connect(onPlayClick)
	
	$CanvasLayer/panelPlay/Panel/Play_Action1.setOnClick(onPlayAction1Click)
	$CanvasLayer/panelPlay/Panel2/Play_Action1.setOnClick(notAvailable)
	$CanvasLayer/panelPlay/Panel3/Play_Action1.setOnClick(onPlayAction3Click)
	
	$CanvasLayer/playBack.setOnClick(onPlayBackClick)
	pass

func _process(delta: float) -> void:
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
	pass
