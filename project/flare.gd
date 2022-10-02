extends Sprite3D
export(PackedScene) var flare

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0
var y = 0
var vecP = Vector3(0,0,0)
var vecS = Vector3(0,0,0)
export (float) var interval
# Called when the node enters the scene tree for the first time.
func _ready():
	vecP = Vector3(rand_range(-1,1),rand_range(-1,1),0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = x + delta
	if x > interval:
		var particle = flare.instance()
		rand_range(10,50)
		particle.linear_velocity = vecS
		if y > 5:
			vecP = Vector3(rand_range(-.1,.1),rand_range(-.1,.1),0)
			vecS = Vector3(0,0,rand_range(5,100))
			y = 0
		particle.translate(vecP)
		add_child(particle)
		x = 0
		y += 1
