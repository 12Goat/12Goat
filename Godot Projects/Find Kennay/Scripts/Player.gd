extends KinematicBody2D

var motion = Vector2()
const SPEED = 300
const GRAVITY = 20
const JUMP_HEIGHT = -650
const FLOOR = Vector2(0,-1)


func restart():
	get_tree().reload_current_scene()
	
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
		
	# vertical motion
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	motion = move_and_slide(motion, FLOOR)
	
	motion.y += GRAVITY
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Enemy" in get_slide_collision(i).collider.name:
				restart()