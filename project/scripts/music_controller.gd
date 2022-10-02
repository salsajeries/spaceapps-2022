extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()
var track_num = 5
var file_paths = ["res://audio/dance.ogg",
				  "res://audio/erf.ogg",
				  "res://audio/moose.ogg",
				  "res://audio/scifi.ogg",
				  "res://audio/house.ogg"]
				
func _ready():
	rng.randomize()

func _process(_delta):
	if(!self.is_playing()):
		var my_random_number = floor(rng.randf_range(0, track_num-0.1))
		print(my_random_number)
		var song : AudioStream = load(file_paths[my_random_number])
		self.stream = song
		self.play()
	
