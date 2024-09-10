extends Node2D

func _ready() -> void:
	$TileMapLayer.set_cell(Vector2(0,0),0,Vector2(0,0),0)
