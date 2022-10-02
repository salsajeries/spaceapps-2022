extends Sprite3D
var flare = preload("res://prefabs/particle.tscn")
var dot
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0
var vecP = Vector3(0,0,0)
var vecS = Vector3(0,0,0)
var rng = RandomNumberGenerator.new()
export (float) var interval
# Called when the node enters the scene tree for the first time.
func _ready():
	vecP = Vector3(rand_range(-1,1),rand_range(-1,1),0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = x + delta
	if x > interval:
		var particle = flare.instance()
		particle.linear_velocity = vecS
		vecP = Vector3(rng.randfn(0,.8),rng.randfn(0,.8),0)
		vecS = Vector3(0,0,rng.randfn(27.48713057981032, 27.3992185093072))
		particle.translate(vecP)
		add_child(particle)
		x = 0
