extends RigidBody
signal hit

# Declare member variables here. Examples:
var a = 0
var rng = RandomNumberGenerator.new()
var start = 0
var hue = 0
var norm_temperature
var total = 0
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.set_seed(Time.get_unix_time_from_system())
	var temperature = rng.randfn(33.57693815221815,14.7579782231735)
	hue= temperature/70
	norm_temperature = hue
	var mat = SpatialMaterial.new()
	mat.set_albedo(Color.from_hsv(hue,1,1))
	mat.set_feature(mat.FEATURE_EMISSION,true)
	mat.set_feature(mat.FEATURE_TRANSPARENT,true)
	mat.set_emission(Color.from_hsv(hue,1,1))
	mat.set_emission_energy(16)
	get_node("CSGMesh").set_material(mat)

#rng.randfn(33.57693815221815,14.7579782231735)/70
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mat = self.get_node("CSGMesh").material
	start += sqrt(delta)/95
	total += delta
	mat.set_albedo(Color.from_hsv(hue- start,1,1))
	mat.set_emission(Color.from_hsv(hue-start,1,1))
	if total > 7:
		queue_free()
