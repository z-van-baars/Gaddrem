extends Control
signal save_as
var file_to_save = ""


func reset():
	file_to_save = ""
	$ConfirmButton.pressed = false
	$CancelButton.pressed = false
	$FileNameField.clear()
	
func _on_ConfirmButton_pressed():
	if $FileNameField.text != "":
		hide()
		emit_signal("save_as", $FileNameField.text)
	else:
		$ConfirmButton.pressed = false

func _on_CancelButton_pressed():
	hide()


func _on_SaveMenu_open():
	reset()
	show()
