extends CanvasLayer
@onready var fps: Label = $fps

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fps.text='FPS: '+str(Engine.get_frames_per_second())
	set_layer(15030)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	fps.text='FPS: '+str(Engine.get_frames_per_second())
	pass # Replace with function body.
