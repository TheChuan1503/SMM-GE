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
var map:Dictionary
var isPlacerDown=false

func _ready() -> void:
	for e in range(26):
		map[e]={}
	Global.isMaker=true
	$Game.initMaker()
	eraser_canvas.visible=false
	$Game/Maker/placer.pressed.connect(place)
	eraser_audio.finished.connect(eraser_reverse_audio.play)
	eraser_reverse_audio.finished.connect(eraser_audio.play)
	
	var startHeight=2
	if Global.level!='':
		var json:Dictionary=Global.getLevelData(Global.level)
		var manifest:Dictionary=json['manifest']
		var world=manifest['world']
		var worldType=world['type']
		var data:Array=json['data']
		startHeight=world['start_height']
		for obj:Array in json['soil']:
			placeOn(obj[0]-1,0 - obj[1],'block_soil')
		for obj:Dictionary in data:
			placeOn(obj['pos'][0]-1,0 - obj['pos'][1],obj['object'])
		
	if startHeight<1:
		startHeight=1
	if startHeight>25:
		startHeight=25
	for i1 in range(startHeight):
		for i2 in range(7):
			placeOn(i2,0 - i1 - 1,'block_soil')
func getMouseLocation():
	var pos:Vector2 = $Game/TileMapLayer.local_to_map(get_global_mouse_position())
	return pos
func place():
	var pos = getMouseLocation()
	if state=='eraser':
		$eraseAudio.stop()
		$eraseAudio.play()
		placeAir(pos.x,pos.y)
	else:
		if not MakerStatus.selectedObjId == '' and $TileMapLayer.get_cell_source_id(pos) == -1:
			placeOn(pos.x,pos.y,MakerStatus.selectedObjId)
func setState(s:String):
	eraser_audio.stop()
	eraser_reverse_audio.stop()
	var color:Color = Color.WHITE
	if s == state:
		state='none'
		MakerStatus.isEraser=false
	else:
		state=s
	if state == 'eraser':
		MakerStatus.isEraser=true
		color=Color(0,0.3,0.7,0.5)
		eraser_reverse_audio.play()
	if state == 'none':
		MakerStatus.isEraser=false
		eraser_canvas.visible=false
	else:
		eraser_canvas.visible=true
		color_top.color=color
		color_left.color=color
		color_bottom.color=color
		color_right.color=color
		
func make():
	setState('none')
	$Game.stopGame()
	$MakerUi.visible=true
	$Game/Maker.visible=true
	GameStatus.initDead()
	$Game/TileMapLayer.visible=false
	$Game/TileMapLayer.clear()
	$TileMapLayer.visible=true
	$AudioStreamPlayer.play()
	
func play():
	$Game/TileMapLayer.clear()
	setState('none')
	$AudioStreamPlayer.stop()
	$MakerUi.visible=false
	$Game/Maker.visible=false
	for e in $TileMapLayer.get_used_cells():
		$Game/TileMapLayer.set_cell(e, 0, Vector2(0,0),Global.getTileIndex('smb',map[0-e.y-1][e.x-1]))
	$Game.startGame()
	$Game/TileMapLayer.visible=true
	$TileMapLayer.visible=false
func _on_playAndMake_pressed() -> void:
	$AnimationPlayer.play("slideOut")
	await $AnimationPlayer.animation_finished
	$CanvasLayer/playAndMake/AudioStreamPlayer.play()
	MakerStatus.isMaking=not MakerStatus.isMaking
	if MakerStatus.isMaking:
		play_and_make.texture=load("res://src/images/action_play.png")
		make()
	else:
		play()
		play_and_make.texture=load("res://src/images/action_make.png")
	$AnimationPlayer.play("slideIn")
	pass # Replace with function body.
func placeOn(x:int,y:int,id:String):
	map[0-y-1][x-1]=id
	$TileMapLayer.set_cell(Vector2(x,y),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb',id))
func placeAir(x:int,y:int):
	map[-0-y-1][x-1]=''
	$TileMapLayer.set_cell(Vector2(x,y),-1)


func _on_placer_button_down() -> void:
	isPlacerDown=true
	pass # Replace with function body.


func _on_placer_button_up() -> void:
	isPlacerDown=false
	pass # Replace with function body.
func _process(delta: float) -> void:
	if isPlacerDown:
		var pos=get_global_mouse_position()
		if pos.y>-170:
			$Game.getMario().position.y+=192*delta
		if pos.y<-20:
			$Game.getMario().position.y-=192*delta
		if pos.x<20:
			$Game.getMario().position.x-=192*delta
		if pos.x>340:
			$Game.getMario().position.x+=192*delta
