extends Sprite3D
export(PackedScene) var flare

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var particle = flare.instance()
	particle.linear_velocity = Vector3(0,0,20)
	add_child(particle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
