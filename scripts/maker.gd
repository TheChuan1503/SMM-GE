extends Node2D

func _ready() -> void:
	Global.isMaker=true
	$Game.initMaker()
	$Game/Maker/placer.pressed.connect(place)
func getMouseLocation():
	var pos:Vector2 = $Game/TileMapLayer.local_to_map(get_global_mouse_position())
	return pos
func place():
	var pos = getMouseLocation()
	print(pos)
	$Game.place(pos.x,pos.y,'block_soil')
