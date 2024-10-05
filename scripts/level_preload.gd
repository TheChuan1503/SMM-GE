extends Control

@onready var title: Label = $ColorRect/Panel/Label
@onready var json:JSON=JSON.new()

var data:Dictionary
var changed=false

func _ready() -> void:
	data=Global.getLevelData(Global.level)
	title.text=data['manifest']['title']
	var type=data['manifest']['world']['type']
	var mario:Node
func _input(event: InputEvent) -> void:
	_on_timer_timeout()
func _on_timer_timeout() -> void:
	changed=true
	SceneChanger.gradient('res://scenes/game.tscn')
	pass # Replace with function body.
