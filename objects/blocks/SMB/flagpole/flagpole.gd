extends StaticBody2D

@onready var sprite_flag: Sprite2D = $SpriteFlag
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var isTouched:=false

func _ready() -> void:
	animation_player.play('RESET')

func _on_area_2d_area_entered(area: Area2D) -> void:
	log(123)
	if not isTouched:
		isTouched=true
		animation_player.play('flagPullDown')
	pass # Replace with function body.
