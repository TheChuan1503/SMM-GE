extends CanvasLayer
func i18n():
	Global.i18n($ColorRect/Label)
	Global.i18n($ColorRect/Label/Label)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	i18n()
	if Global.isDebug:
		SceneChanger.gradient('res://scenes/launch_animation_scene.tscn')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Timer.is_stopped():
		SceneChanger.gradient('res://scenes/launch_animation_scene.tscn')
	pass
