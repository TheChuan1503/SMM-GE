extends Control
@onready var icon: TextureRect = $Panel/Panel/icon

var id = ''

func setObject(id:String):
	self.id=id
	var type = id.split('_')[0]
	match type:
		'block':
			type = 'block'
		'item':
			type = 'block'
			
	var name = id.substr(id.split('_')[0].length() + 1)
	icon.texture=load("res://objects/"+type+"s/SMB/"+name+"/"+name+".png")
func _on_selectable_button_pressed() -> void:
	MakerStatus.selectedObjId=id
	pass # Replace with function body.
