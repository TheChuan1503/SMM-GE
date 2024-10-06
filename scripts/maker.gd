extends Node2D
@onready var play_and_make: TextureRect = $CanvasLayer/playAndMake
@onready var eraser_canvas: CanvasLayer = $CanvasLayer/eraserCanvas
@onready var color_top: ColorRect = $CanvasLayer/eraserCanvas/colorTop
@onready var color_left: ColorRect = $CanvasLayer/eraserCanvas/colorLeft
@onready var color_bottom: ColorRect = $CanvasLayer/eraserCanvas/colorBottom
@onready var color_right: ColorRect = $CanvasLayer/eraserCanvas/colorRight
@onready var eraser_audio: AudioStreamPlayer = $CanvasLayer/eraserCanvas/eraserAudio
@onready var eraser_reverse_audio: AudioStreamPlayer = $CanvasLayer/eraserCanvas/eraserReverseAudio

var state

func _ready() -> void:
	Global.isMaker=true
	$Game.initMaker()
	eraser_canvas.visible=false
	$Game/Maker/placer.pressed.connect(place)
	eraser_audio.finished.connect(eraser_reverse_audio.play)
	eraser_reverse_audio.finished.connect(eraser_audio.play)
func getMouseLocation():
	var pos:Vector2 = $Game/TileMapLayer.local_to_map(get_global_mouse_position())
	return pos
func place():
	var pos = getMouseLocation()
	if MakerStatus.isEraser:
		$eraseAudio.stop()
		$eraseAudio.play()
		$Game.placeAir(pos.x,pos.y)
	else:
		if not MakerStatus.selectedObjId == '' and $Game/TileMapLayer.get_cell_source_id(pos) == -1:
			$Game.place(pos.x,pos.y,MakerStatus.selectedObjId)
func setState(s:String):
	eraser_audio.stop()
	eraser_reverse_audio.stop()
	var color:Color = Color.WHITE
	if s == state:
		state='none'
	else:
		state=s
	if state == 'eraser':
		color=Color(0,0.3,0.7,0.5)
		eraser_reverse_audio.play()
	if state == 'none':
		eraser_canvas.visible=false
	else:
		eraser_canvas.visible=true
		color_top.color=color
		color_left.color=color
		color_bottom.color=color
		color_right.color=color
		
func make():
	$Game.stopGame()
	$MakerUi.visible=true
	$Game/Maker.visible=true
	GameStatus.initDead()
	$AudioStreamPlayer.play()
func play():
	$AudioStreamPlayer.stop()
	setState('none')
	$MakerUi.visible=false
	$Game/Maker.visible=false
	$Game.startGame()
func _on_playAndMake_pressed() -> void:
	$AnimationPlayer.play("slideOut")
	await $AnimationPlayer.animation_finished
	MakerStatus.isMaking=not MakerStatus.isMaking
	if MakerStatus.isMaking:
		play_and_make.texture=load("res://src/images/action_play.png")
		make()
	else:
		play()
		play_and_make.texture=load("res://src/images/action_make.png")
	$AnimationPlayer.play("slideIn")
	pass # Replace with function body.
