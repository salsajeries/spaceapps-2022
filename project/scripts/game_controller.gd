extends Spatial

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()
