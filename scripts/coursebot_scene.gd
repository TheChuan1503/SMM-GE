extends Control

func _on_bgm_finished() -> void:
	$bgm.play()
	pass # Replace with function body.
func _ready() -> void:
	Global.getLevelsDir()
