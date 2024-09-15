extends Control
@onready var virtual_background: TextureRect = $virtualBackground

func _on_bgm_finished() -> void:
	$bgm.play()
	pass # Replace with function body.
func _ready() -> void:
	virtual_background.visible=false
	Global.getLevelsDir()
