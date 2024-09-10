extends Node2D

@onready var gameover=false

func _ready() -> void:
	$AudioStreamPlayer.finished.connect(playMusic)
	var json:JSON=JSON.new()
	json.parse(FileAccess.open('res://test/a.sge.json',FileAccess.READ).get_as_text())
	var data:Array=json.data['data']
	print(data)
	for obj:Dictionary in data:
		print("------------------------")
		print(obj)
		$TileMapLayer.set_cell(Vector2(obj['pos'][0]-1,0 - obj['pos'][1]),0,Vector2(0,0),Global.getTileIndex(json.data['manifest']['world']['type'],obj['object']))

func  _process(delta: float) -> void:
	if $PlayerSmb0.position.y > -2 and gameover==false:
		gameover=true
		DialogInfo.make('Game Over','Press OK to retry',onGameOver)

func onGameOver():
	SceneChanger.gradient('res://scenes/title_scene.tscn')
func playMusic():
	$AudioStreamPlayer.play()
