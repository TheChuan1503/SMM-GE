extends Node2D

func _ready() -> void:
	$Game.loadJson('/storage/emulated/0/SMM_GE/a.sge.json')
	$Game.loadTiles()
	pass
