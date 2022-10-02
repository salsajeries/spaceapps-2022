extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var input_vector : Vector2
var velocity : Vector2
export (int) var acceleration = 10
export (int) var max_speed = 500

var rotation_dir : int 
export (float) var rotation_speed = 0.001
export (float) var friction_weight = 0
func _physics_process(delta):
	self.global_rotate(transform.basis.x.normalized(), get_node("../wheel_A").get("rotation_offset"))
	self.global_rotate(transform.basis.y.normalized(), get_node("../wheel_B").get("rotation_offset"))
	self.global_rotate(transform.basis.z.normalized(), get_node("../wheel_C").get("rotation_offset"))
	#self.rotate_object_local(Vector3(get_node("../wheel_A").get("rotation_offset"),get_node("../wheel_B").get("rotation_offset"),get_node("../wheel_C").get("rotation_offset")),10)
