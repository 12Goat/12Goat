extends KinematicBody2D

var target: Vector2
var direction: Vector2
var motion: Vector2
var speed := 920
var value_for_spwning_position


func _ready():
	target = get_global_mouse_position()
	position = value_for_spwning_position
	direction = (target - position).normalized()
	pass # Replace with function body.


func _process(delta):
	motion = direction * speed
	move_and_slide(motion)