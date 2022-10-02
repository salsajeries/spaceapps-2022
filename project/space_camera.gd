extends Spatial

var camrot_h = 0
var camrot_v = 0
var cam_v_max = 75
var cam_v_min = -55
var h_sensitivity = 0.1
var v_sensitivity = 0.1
var h_acceleration = 10
var v_acceleration = 10

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_node("h/v/ClippedCamera").add_exception(get_parent())
	
func _input(event):
	if event is InputEventMouseMotion:
		camrot_h += -event.relative.x * h_sensitivity
		camrot_v += event.relative.y * v_sensitivity
		
func _physics_process(delta):
	camrot_v = clamp(camrot_v, cam_v_min, cam_v_max)
	get_node("h").rotation_degrees.y = lerp(get_node("h").rotation_degrees.y, camrot_h, delta* h_acceleration)
	get_node("h/v").rotation_degrees.x = lerp(get_node("h/v").rotation_degrees.x, camrot_v, delta * v_acceleration)


