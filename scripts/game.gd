extends Node2D

@onready var gameover=false

func _ready() -> void:
	Global.scene='game'
	$AudioStreamPlayer.finished.connect(playMusic)
	var json:JSON=JSON.new()
	json.parse(FileAccess.open(Global.getLevelsDir()+Global.level,FileAccess.READ).get_as_text())
	var data:Array=json.data['data']
	$ParallaxBackground/background/background.texture=load("res://src/images/game_bg/"+json.data['manifest']['world']['type']+"_"+json.data['manifest']['world']['world']+".png")
	for obj:Dictionary in data:
		$TileMapLayer.set_cell(Vector2(obj['pos'][0]-1,0 - obj['pos'][1]),Global.getTileClassId(json.data['manifest']['world']['type']),Vector2(0,0),Global.getTileIndex(json.data['manifest']['world']['type'],obj['object']))
	for i1 in range(2):
		for i2 in range(7):
			$TileMapLayer.set_cell(Vector2(i2,0 - i1 - 1),Global.getTileClassId(json.data['manifest']['world']['type']),Vector2(0,0),Global.getTileIndex(json.data['manifest']['world']['type'],'block_soil'))

func  _process(delta: float) -> void:
	if not PauseMenu.opened:
		if Input.is_action_pressed("pause"):
			get_tree().paused=true
			PauseMenu.make()
	if $PlayerSmb0.position.y > -2 and gameover==false:
		gameover=true
		DialogInfo.make('Game Over','Press OK to retry',onGameOver)

func onGameOver():
	SceneChanger.gradient('res://scenes/title_scene.tscn')
func playMusic():
	$AudioStreamPlayer.play()
