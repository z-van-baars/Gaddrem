extends Control

signal load_profile
onready var saves = []
onready var file_to_load = ""
onready var button_scene = preload("res://SaveButton.tscn")


func reset():
	for each in $SaveButtons.get_children():
		each.queue_free()
	saves = []
	file_to_load = ""

func create_buttons():
	$FileNameBackground/FileToLoadLabel.text = file_to_load
	for each in list_saves():
		saves.append(each.trim_suffix(".json"))
	
	for each in saves:
		var new_button = button_scene.instance()
		$SaveButtons.add_child(new_button)
		new_button.get_node("Button/Character").text = each
		new_button.connect(
			"save_pressed",
			self,
			"_on_SaveButton_pressed")

func list_saves():
	var files = []
	var dir = Directory.new()
	dir.open("res://Saves/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)
	dir.list_dir_end()
	return files


func _on_SaveButton_pressed(profile_name):
	reset()
	file_to_load = profile_name
	create_buttons()


func _on_LoadButton_pressed():
	emit_signal("load_profile", file_to_load)
	hide()


func _on_CancelButton_pressed():
	reset()
	hide()


func _on_open_load_menu():
	reset()
	create_buttons()
	show()
