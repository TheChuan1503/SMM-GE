extends StaticBody2D
var tileMap
var touched=false

func _ready() -> void:
	var node = self
	while node:
		if node is TileMapLayer:
			tileMap=node
			return
		else:
			node=node.get_parent()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player' and not touched:
		touched=true
		hide()
		GameStatus.coin+=1
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
		tileMap.set_cell(tileMap.local_to_map(position), -1)
	pass # Replace with function body.
