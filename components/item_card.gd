extends Panel
@onready var icon: TextureRect = $Panel/icon
@onready var panel: Panel = self
@onready var panel2: Panel = $Panel/Panel

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
func _process(delta: float) -> void:
	if MakerStatus.selectedObjId!=id:
		self['theme_override_styles/panel']['bg_color']=Color.WHITE
func _on_selectable_button_pressed() -> void:
	if MakerStatus.selectedObjId==id:
		MakerStatus.selectedObjId=''
		return
	self['theme_override_styles/panel']['bg_color']=Global.COLOR_RED
	# panel2['theme_override_styles/panel']['bg_color']=Global.COLOR_RED
	MakerStatus.selectedObjId=id
	pass # Replace with function body.


func _on_selectable_button_mouse_entered() -> void:
	position.y=-8
	pass # Replace with function body.


func _on_selectable_button_mouse_exited() -> void:
	position.y=0
	pass # Replace with function body.
