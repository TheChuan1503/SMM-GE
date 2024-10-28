extends CharacterBody2D

const SPEED_RUN=75
const SPEED_RUN_MAX=135
const SPEED_RUN_P=180
const SPEED_JUMP=-400
const JUMP_HOLD_TIME=1
var g=SPEED_RUN/0.175

var isRun=false
var dead=false
var nowSpeed=SPEED_RUN
var isJumping=false

@onready var animationPlayer:AnimationPlayer=$AnimationPlayer
@onready var sprite2D:Sprite2D=$Sprite2D
@onready var jumpHoldTimer: Timer = $Timer3
@onready var camera_2d: Camera2D = $Sprite2D/Camera2D

var gravity=ProjectSettings.get('physics/2d/default_gravity')
func _ready() -> void:
	gravity=900
	if Global.scene == 'game' and not Global.isMaker:
		var manifest:Dictionary=Global.getLevelData()['manifest']
		var world=manifest['world']
		camera_2d.set_limit(SIDE_RIGHT,( world['width'] + 1 ) * 16)
func _physics_process(delta: float) -> void:
	if dead:
		return
	var direction=Input.get_axis('move_left','move_right')
	if not is_zero_approx(direction) and $Timer.is_stopped():
		$Timer.start()
	else:
		$Timer.stop()
	if $Timer.is_stopped() and not is_zero_approx(direction):
		nowSpeed=SPEED_RUN_MAX
	else:
		nowSpeed=SPEED_RUN
	
	if not is_zero_approx(direction) and $Timer2.is_stopped():
		$Timer2.start()
	else:
		$Timer2.stop()
	if $Timer2.is_stopped() and not is_zero_approx(direction):
		nowSpeed=SPEED_RUN_P
	else:
		nowSpeed=SPEED_RUN_MAX
	
	g=nowSpeed/0.175
	velocity.x=move_toward(velocity.x,direction*nowSpeed,g*delta)
	velocity.y+=gravity*delta
	if is_on_floor() and Input.is_action_just_pressed('jump'):
		isJumping=true
		jumpHoldTimer.stop()
		jumpHoldTimer.start()
		velocity.y+=SPEED_JUMP
		$jumpAudio.play()
	if isJumping and not is_on_floor():
		velocity.y-=0*jumpHoldTimer.time_left / JUMP_HOLD_TIME
	if is_on_floor():
		if is_zero_approx(direction) or is_zero_approx(velocity.x):
			animationPlayer.play('idle')
		else:
			animationPlayer.play('running')
		if not is_zero_approx(direction):
			sprite2D.flip_h=direction<0
	else:
		animationPlayer.play('jump')
	move_and_slide()
func die(cb=0):
	dead=true
	gravity=0
	$deadAudio.play()
	GameStatus.initDead()
	animationPlayer.play('dead')
	await animationPlayer.animation_finished
	if cb is Callable:
		cb.call()
func antiDie():
	dead=false
	animationPlayer.play('RESET')
func setCollisionEnable(boo):
	$CollisionShape2D.disabled=!boo
	$Area2D.monitorable=boo
