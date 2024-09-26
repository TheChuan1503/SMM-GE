extends CanvasLayer

@onready var animation:AnimationPlayer = $AnimationPlayer
var lastScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func init(path):
	if MainMenu.opened and path == lastScene:
		return true
	lastScene=path
func gradient (path):
	if init(path):
		return
	self.show()
	self.set_layer(1503)
	animation.play('gradient')
	await animation.animation_finished
	get_tree().change_scene_to_file(path)
	get_tree().paused=false
	animation.play_backwards('gradient')
	await animation.animation_finished
	self.set_layer(-1)
	self.hide()
	pass
