extends StaticBody2D
#func _ready() -> void:
	#var node = self
	#while node:
		#if node is TileMap:
			#tileMap=node
			#return
		#else:
			#node=node.get_parent()

func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.name == 'Player':
		##tileMap.set_cell(tileMap.local_to_map(position), -1)
		#print('aa')
	#print(body.name)
	pass # Replace with function body.
