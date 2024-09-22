extends CanvasLayer
var animated=false
func _ready() -> void:
	OS.request_permissions()
	$Timer2.timeout.connect($AudioStreamPlayer.play)
	await $AnimationPlayer.animation_finished
	animated=true
	$Timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Timer.is_stopped() and animated or Global.isDebug:
		SceneChanger.gradient('res://scenes/title_scene.tscn')
	pass
