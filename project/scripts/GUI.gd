extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/Number

var player_current_health = 100
var player_current_score = 0

func _ready():		# Get character node max health value
	#bar.max_value = 100
	get_node("Bars/LifeBar/TextureProgress").value = 100
	
func _process(_delta):
	player_current_health = get_node("../psp_3d").get("Health")
	player_current_score = get_node("../psp_3d").get("score")

	if(player_current_health <= 0):
		get_tree().change_scene("res://master_scene.tscn")

	number_label.text = str(player_current_health)
	get_node("Bars/LifeBar/TextureProgress").value = player_current_health
	get_node("../Score").text = "Points: " + str(player_current_score)
