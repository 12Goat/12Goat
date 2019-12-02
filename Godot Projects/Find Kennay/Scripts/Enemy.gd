extends KinematicBody2D

var motion = Vector2()
const SPEED = 300
const GRAVITY = 40
const FLOOR = Vector2(0,-1)
var direction = 1
var player = null

func _physics_process(delta):
	if player:
		# move towards player
		motion = (player.position - position).normalized() * SPEED
		motion.y = 0
		
	motion.y += GRAVITY
	
	motion = move_and_slide(motion, FLOOR)
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				restart()

func _on_Detect_radius_body_entered(body):
	if body.name == "Player":
		player = body
	
func _on_Detect_radius_body_exited(body):
	player = null
	
func restart():
	get_tree().reload_current_scene()
