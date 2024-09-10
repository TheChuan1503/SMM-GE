extends StaticBody2D

func bounce():
	$AnimationPlayer.play("bounce")

func _on_area_2d_area_entered(area: Area2D) -> void:
	bounce()
