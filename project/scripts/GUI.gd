extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween

func _ready():
	var player_max_health = $"res://prefabs/psp_3d".max_health		# Get character node max health value
	bar.max_value = player_max_health
