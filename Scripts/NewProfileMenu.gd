extends Control
signal new_profile

func reset():
	$CharacterNameField.clear()
	$ClassField.clear()
	$CreateButton.pressed = false
	$CancelButton.pressed = false

func _on_CreateButton_pressed():
	emit_signal("new_profile", $CharacterNameField.text, $ClassField.text)
	hide()


func _on_CancelButton_pressed():
	hide()


func _on_NewProfileButton_pressed():
	reset()
	show()
