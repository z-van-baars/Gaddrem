extends Control
onready var enabled = true

func enable():
	$Sprite.modulate = Color(0.18, 0.93, 0.07)
	enabled = true

func disable():
	$Sprite.modulate = Color(0.72, 0.04, 0.04)
	enabled = false
