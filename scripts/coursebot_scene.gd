extends Control
@onready var virtual_background: TextureRect = $virtualBackground
func i18n():
	Global.i18n($head/title)
	Global.i18n($ColorRect/Panel/own)

func _on_bgm_finished() -> void:
	$bgm.play()
	pass # Replace with function body.
func _ready() -> void:
	Global.scene='coursebot'
	i18n()
	virtual_background.visible=false
	Global.getLevelsDir()
