#extends CharacterBody2D
#
#const SPEED_RUN=100
#const SPEED_JUMP=-400
#
#@onready var animationPlayer:AnimationPlayer
#@onready var sprite2D:Sprite2D
#
#var gravity=ProjectSettings.get('physics/2d/default_gravity')
#
#func setAttr(a,b):
	#animationPlayer=a
	#sprite2D=b
#
#func _physics_process(delta: float) -> void:
	#var direction=Input.get_axis('move_left','move_right')
	#velocity.x=direction*SPEED_RUN
	#velocity.y+=gravity*delta
	#if is_on_floor() and Input.is_action_just_pressed('jump'):
		#velocity.y=SPEED_JUMP
	#if is_on_floor():
		#if is_zero_approx(direction):
			#animationPlayer.play('idle')
		#else:
			#sprite2D.flip_h=direction<0
			#animationPlayer.play('running')
	#else:
		#animationPlayer.play('jump')
	#move_and_slide()
