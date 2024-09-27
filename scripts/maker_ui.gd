extends CanvasLayer
@onready var btn_eraser: Panel = $Panel/ColorRect2/BtnEraser


func _ready() -> void:
	MakerStatus.init()
	btn_eraser.setOnClick(eraser)
	pass # Replace with function body.

func eraser():
	MakerStatus.isEraser = not MakerStatus.isEraser
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
