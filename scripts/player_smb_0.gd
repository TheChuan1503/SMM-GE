extends CharacterBody2D

const SPEED_RUN=120
const SPEED_JUMP=-400
const g=SPEED_RUN/0.175

@onready var animationPlayer:AnimationPlayer=$AnimationPlayer
@onready var sprite2D:Sprite2D=$Sprite2D

var gravity=ProjectSettings.get('physics/2d/default_gravity')

func _physics_process(delta: float) -> void:
	var direction=Input.get_axis('move_left','move_right')
	velocity.x=move_toward(velocity.x,direction*SPEED_RUN,g*delta)
	velocity.y+=gravity*delta
	if is_on_floor() and Input.is_action_just_pressed('jump'):
		velocity.y=SPEED_JUMP
	if is_on_floor():
		if is_zero_approx(direction) and is_zero_approx(velocity.x):
			animationPlayer.play('idle')
		else:
			animationPlayer.play('running')
		if not is_zero_approx(direction):
			sprite2D.flip_h=direction<0
	else:
		animationPlayer.play('jump')
	move_and_slide()
