extends Node2D

@onready var gameover=false
@onready var time_timer: Timer = $timeTimer

var mario:Node
var levelWidth:=0

func _ready() -> void:
	Global.scene='game'
	if not get_parent() is Node2D:
		Global.isMaker=false
	#Global.tilemap=$TileMapLayer
	$AudioStreamPlayer.finished.connect(playMusic)
	if Global.level == '' and ( Global.isMaker or get_parent() is Node2D ):
		return
	var json:Dictionary=Global.getLevelData(Global.level)
	var manifest:Dictionary=json['manifest']
	var world=manifest['world']
	var worldType=world['type']
	var data:Array=json['data']
	$ParallaxBackground/background/background.texture=load("res://src/images/game_bg/"+worldType+"_"+world['world']+".png")
	if not Global.isMaker:
		for obj:Array in json['soil']:
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
	
		# init end soil
		var endHeight=world['end_height']
		if endHeight<1:
			endHeight=1
		if endHeight>12:
			endHeight=12
		for i1 in range(endHeight):
			for i2 in range(10):
				$TileMapLayer.set_cell(Vector2(manifest['world']['width'] - i2,0 - i1 - 1),Global.getTileClassId(worldType),Vector2(0,0),Global.getTileIndex(worldType,'block_soil'))
		levelWidth = manifest['world']['width']
		# load mario
	
		match worldType:
			'smb':
				mario=preload("res://objects/players/smb/smb_0.tscn").instantiate()
			'smb3':
				mario=preload("res://objects/players/smb3/smb3_0.tscn").instantiate()
		mario.position=Vector2((3.5 + 0.5) * 16,0 - startHeight * 16)
		$startArrow.position.y=-48 - startHeight * 16
		initFlagpole(manifest['world']['width'],endHeight)
		add_child(mario)
func initFlagpole(width,endHeight):
	$TileMapLayer.set_cell(Vector2(width - 10 + 1,0 - endHeight - 1),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb','block_flagpole'))
func  _process(delta: float) -> void:
	if mario.position.x < 8:
		mario.position.x=8
	if mario.position.x > levelWidth * 16 + 8:
		mario.position.x=levelWidth * 16 + 8
	if mario.position.y > 8 and gameover==false and ( not Global.isMaker or not MakerStatus.isMaking ):
		gameover=true
		$AudioStreamPlayer.stop()
		mario.die(onGameOver)
	if Global.isMaker:
		if MakerStatus.isMaking:
			if Input.is_action_pressed("move_up"):
				mario.position.y-=192*delta
			if Input.is_action_pressed("move_down"):
				mario.position.y+=192*delta
				if mario.position.y > 0:
					mario.position.y=0
		return
	time_timer.start()
	if not PauseMenu.opened:
		if Input.is_action_pressed("pause"):
			get_tree().paused=true
			PauseMenu.make(mario)

func onGameOver():
	time_timer.stop()
	if not Global.isMaker:
		SceneChanger.gradient('res://scenes/game.tscn',true)
	else:
		mario.antiDie()
		get_parent().make()
func playMusic():
	$AudioStreamPlayer.play()
func place(x:int,y:int,id:String):
	$TileMapLayer.set_cell(Vector2(x,y),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb',id))
func placeAir(x:int,y:int):
	$TileMapLayer.set_cell(Vector2(x,y),-1)
func initMaker():
	if not Global.level == '':
		stopGame()
		return
	# init start soil
	var startHeight=2
	#if startHeight<1:
		#startHeight=1
	#if startHeight>25:
		#startHeight=25
	#for i1 in range(startHeight):
		#for i2 in range(7):
			#$TileMapLayer.set_cell(Vector2(i2,0 - i1 - 1),Global.getTileClassId('smb'),Vector2(0,0),Global.getTileIndex('smb','block_soil'))
	#
	# load mario
	mario=preload("res://objects/players/smb/smb_0.tscn").instantiate()
	mario.position=Vector2((3.5 + 0.5) * 16,0 - startHeight * 16)
	$startArrow.position.y=-48 - startHeight * 16
	add_child(mario)
	stopGame()
func startGame():
	$AudioStreamPlayer.play()
	MakerStatus.isMaking=false
	mario.gravity=900
	mario.setCollisionEnable(true)
	time_timer.start()
func stopGame():
	time_timer.stop()
	$AudioStreamPlayer.stop()
	MakerStatus.isMaking=true
	mario.velocity.x=0
	mario.velocity.y=0
	mario.gravity=0
	mario.antiDie()
	mario.setCollisionEnable(false)
func getMario():
	return mario
func _on_time_timer_timeout() -> void:
	GameStatus.time-=1
	pass # Replace with function body.
