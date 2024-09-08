extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.isDebug:
		SceneChanger.gradient('res://scenes/launch_animation_scene.tscn')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Timer.is_stopped():
		SceneChanger.gradient('res://scenes/launch_animation_scene.tscn')
	pass
