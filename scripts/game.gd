extends Node2D

@onready var gameover=false

var mario:Node
func _ready() -> void:
	Global.scene='game'
	#Global.tilemap=$TileMapLayer
	$AudioStreamPlayer.finished.connect(playMusic)
	if Global.isMaker or get_parent() is Node2D:
		return
	var json:JSON=JSON.new()
	json.parse(FileAccess.open(Global.getLevelsDir()+Global.level,FileAccess.READ).get_as_text())
	var manifest:Dictionary=json.data['manifest']
	var world=manifest['world']
	var worldType=world['type']
	var data:Array=json.data['data']
	$ParallaxBackground/background/background.texture=load("res://src/images/game_bg/"+worldType+"_"+world['world']+".png")
	for obj:Array in json.data['soil']:
		$TileMapLayer.set_cell(Vector2(obj[0]-1,0 - obj[1]),Global.getTileClassId(worldType),Vector2(0,0),Global.getTileIndex(worldType,'block_soil'))
	for obj:Dictionary in data:
		$TileMapLayer.set_cell(Vector2(obj['pos'][0]-1,0 - obj['pos'][1]),Global.getTileClassId(worldType),Vector2(0,0),Global.getTileIndex(worldType,obj['object']))
	
	# init start soil
	var startHeight=world['start_height']
	if startHeight<1:
		startHeight=1
	if startHeight>25:
		startHeight=25
	for i1 in range(startHeight):
		for i2 in range(7):
			$TileMapLayer.set_cell(Vector2(i2,0 - i1 - 1),Global.getTileClassId(worldType),Vector2(0,0),Global.getTileIndex(worldType,'block_soil'))
	
	# init start soil
	var endHeight=world['end_height']
	if endHeight<1:
		endHeight=1
	if endHeight>12:
		endHeight=12
	for i1 in range(endHeight):
		for i2 in range(10):
			$TileMapLayer.set_cell(Vector2(manifest['world']['width'] - i2,0 - i1 - 1),Global.getTileClassId(worldType),Vector2(0,0),Global.getTileIndex(worldType,'block_soil'))
	
	# load mario
	
	match worldType:
		'smb':
			mario=preload("res://objects/players/smb/smb_0.tscn").instantiate()
		'smb3':
			mario=preload("res://objects/players/smb3/smb3_0.tscn").instantiate()
	mario.position=Vector2((3.5 + 0.5) * 16,0 - startHeight * 16 - 16)
	add_child(mario)

func  _process(delta: float) -> void:
	if Global.isMaker:
		return
	if not PauseMenu.opened:
		if Input.is_action_pressed("pause"):
			get_tree().paused=true
			PauseMenu.make()
	if $Player.position.y > -2 and gameover==false:
		gameover=true
		$AudioStreamPlayer.stop()
		mario.die(onGameOver)

func onGameOver():
	SceneChanger.gradient('res://scenes/game.tscn')
func playMusic():
	$AudioStreamPlayer.play()
func place(x:int,y:int,id:String):
	$TileMapLayer.set_cell(Vector2(x,y),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb',id))
func placeAir(x:int,y:int):
	$TileMapLayer.set_cell(Vector2(x,y),-1)
func initMaker():
	# init start soil
	var startHeight=2
	if startHeight<1:
		startHeight=1
	if startHeight>25:
		startHeight=25
	for i1 in range(startHeight):
		for i2 in range(7):
			$TileMapLayer.set_cell(Vector2(i2,0 - i1 - 1),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb','block_soil'))
	
	# load mario
	var mario
	mario=preload("res://objects/players/smb/smb_0.tscn").instantiate()
	mario.position=Vector2((3.5 + 0.5) * 16,0 - startHeight * 16 - 16)
	add_child(mario)
