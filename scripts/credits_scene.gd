extends CanvasLayer

func i18n():
	Global.i18n($ColorRect/Label)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMenu.hide()
	Settings.hide()
	i18n()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	SceneChanger.gradient('res://scenes/title_scene.tscn')
	pass # Replace with function body.
