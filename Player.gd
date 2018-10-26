extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 50
const GRAV = 20
const MAX_SPEED = 200
const JUMP_HEIGHT = -550




var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAV
	var friction  = false 
	

	if Input.is_action_pressed("ui_left"):
		motion.x -= ACCELERATION
		motion.x = max(motion.x - ACCELERATION, - MAX_SPEED)
		$SpritePlayer.flip_h = true
		$SpritePlayer.play("walk")
	elif Input.is_action_pressed("ui_right"):
		motion.x += ACCELERATION
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$SpritePlayer.flip_h = false
		$SpritePlayer.play("walk")
	else:
		$SpritePlayer.play("idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
		
	else: 
		$SpritePlayer.play("jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)

			
	motion = move_and_slide(motion, UP)
	pass
	
	
