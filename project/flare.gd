extends Sprite3D
export(PackedScene) var flare

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0
export (int) var interval
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = x + delta
	if x > interval:
		var particle = flare.instance()
		particle.linear_velocity = Vector3(0,0,20)
		add_child(particle)
		x = 0
