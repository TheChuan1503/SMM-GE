extends TextureButton

func playClickSound():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("action")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("RESET")
func playSelectSound():
	$AudioStreamPlayer2.play()
func _ready() -> void:
	self.pressed.connect(playClickSound)
	#self.focus_entered.connect(playSelectSound)
	pass
