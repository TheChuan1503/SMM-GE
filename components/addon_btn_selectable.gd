extends TextureButton
@onready var left_top: TextureRect = $leftTop
@onready var right_top: TextureRect = $rightTop
@onready var left_bottom: TextureRect = $leftBottom
@onready var right_bottom: TextureRect = $rightBottom

func setOnClick(fun:Callable):
	pressed.connect(fun)
func _ready() -> void:
	setBorderVisible(false)
func _on_mouse_entered() -> void:
	$AudioStreamPlayer.play()
	setBorderVisible(true)
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	setBorderVisible(false)
	pass # Replace with function body.
func setBorderVisible(status):
	left_top.visible=status
	left_bottom.visible=status
	right_bottom.visible=status
	right_top.visible=status
