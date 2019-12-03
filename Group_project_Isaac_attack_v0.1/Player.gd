extends KinematicBody2D
const BULLET = preload("res://bullet.tscn")


#declare variables
var motion = Vector2()
const SPEED = 340
const GRAVITY = 27
const JUMP_HEIGHT = -652
const UP = Vector2(0,-1)
var fire_timer = 0
var fire_rate = 0.22

func _physics_process(delta):
	# lateral motion
	if Input.is_action_pressed("ui_right"):
		# move 20 px right
		motion.x = SPEED
	
	elif Input.is_action_pressed("ui_left"):
		# move 20 px left
		motion.x = -SPEED
	
	else:
		# if no button is pressed, don't move
		motion.x = 0
	
	
	#shooting
	fire_timer += delta
	if Input.is_mouse_button_pressed(1) and fire_timer > fire_rate:
		shoot()
		fire_timer = 0
	
	
	# vertical motion
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	motion = move_and_slide(motion, UP)
	
	motion.y += GRAVITY

#shooting function
func shoot():
	var bullet = BULLET.instance()
	bullet.value_for_spwning_position = self.global_position
	get_parent().add_child(bullet)


	