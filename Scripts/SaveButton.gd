extends Control
signal save_pressed


func _on_Button_pressed():
	emit_signal("save_pressed", $Button/Character.text)
