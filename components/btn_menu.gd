extends Panel

func _ready() -> void:
	$SelectableButton.setOnClick(MainMenu.make)
	pass
