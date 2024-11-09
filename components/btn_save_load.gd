extends Panel

func _ready() -> void:
	Global.i18n($Label)
func setOnClick(c:Callable):
	$SelectableButton.setOnClick(c)
