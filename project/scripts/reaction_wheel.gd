extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var press_left = "null"
export (String) var press_right = "null"
export (int) var rotation_dir = 0 
export (float) var rotation_speed = 0.005
export (float) var rotation_start = .2
export (float) var friction_weight = 0
export (float) var rotation_offset = 0
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	rotation_offset = (rotation_dir * rotation_speed * delta)
	rotation += (rotation_offset + rotation_start)
	#print(rotation)
	if Input. is_action_pressed(press_right):
		rotation_dir += 1  
	if Input. is_action_pressed(press_left):
		rotation_dir += -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
