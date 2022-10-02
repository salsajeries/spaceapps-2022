extends KinematicBody
export (float) var Health
var score = 0
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
	self.global_rotate(transform.basis.x.normalized(), get_node("../wheel_A").get("rotation_offset")/10)
	self.global_rotate(transform.basis.y.normalized(), get_node("../wheel_B").get("rotation_offset")/10)
	self.global_rotate(transform.basis.z.normalized(), get_node("../wheel_C").get("rotation_offset")/10)
	#self.rotate_object_local(Vector3(get_node("../wheel_A").get("rotation_offset"),get_node("../wheel_B").get("rotation_offset"),get_node("../wheel_C").get("rotation_offset")),10)


func _on_Cup_body_entered(body):
	if(body.is_in_group("Particle")):
		score += 100
		print(score)
		body.queue_free()


func _on_Body_body_entered(body):
	if(body.is_in_group("Particle")):
		Health -= body.get("norm_temperature")*10
		print(Health)
		body.queue_free()


func _on_Shield_body_entered(body):
	if(body.is_in_group("Particle")):
		body.queue_free()
