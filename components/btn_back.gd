extends Panel

@onready var onClick:Callable
func cb():
	$AudioStreamPlayer.play()
	onClick.call()
func setOnClick(a:Callable):
	onClick=a
	$SelectableButton.setOnClick(cb)
