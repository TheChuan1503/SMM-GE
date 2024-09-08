extends TextureButton

func playClickSound():
	$AudioStreamPlayer.play()
func playSelectSound():
	$AudioStreamPlayer2.play()
func _ready() -> void:
	self.pressed.connect(playClickSound)
	#self.focus_entered.connect(playSelectSound)
	pass
