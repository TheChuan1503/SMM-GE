extends Control

@onready var title: Label = $ColorRect/Panel/Label
@onready var json:JSON=JSON.new()

var data:Dictionary
var changed=false

func _ready() -> void:
	json.parse(FileAccess.open(Global.getLevelsDir()+Global.level,FileAccess.READ).get_as_text())
	data=json.data
	title.text=data['manifest']['title']
	var type=data['manifest']['world']['type']
	var mario:Node
func _input(event: InputEvent) -> void:
	_on_timer_timeout()
func _on_timer_timeout() -> void:
	changed=true
	SceneChanger.gradient('res://scenes/game.tscn')
	pass # Replace with function body.
