extends Node2D

onready var entrybox_scene = preload("res://EntryBox.tscn")
onready var character_name_string = ""
onready var character_class_string = ""

func save(file_name_string):
	var data = {
		"Character Name": $UILayer/InventoryMgr.character_name_string,
		"Character Class": $UILayer/InventoryMgr.character_class_string,
		"Inventory": $UILayer/InventoryMgr.items}
	var file = File.new()
	file.open("res://Saves/" + file_name_string + ".json", File.WRITE)
	var json = to_json(data)
	file.store_line(json)
	file.close()


func load_inv(file_name_string):
	var file = File.new()
	if file.file_exists("res://Saves/" + file_name_string + ".json"):
		file.open("res://Saves/" + file_name_string + ".json", File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		$UILayer/InventoryMgr.reset()
		character_name_string = data["Character Name"]
		character_class_string = data["Character Class"]
		
		$UILayer/InventoryMgr.items = data["Inventory"]
		$UILayer/InventoryMgr.update_list()


func _on_SaveMenu_save_as(file_name_string):
	save(file_name_string)


func _on_LoadMenu_load_profile(file_name_string):
	load_inv(file_name_string)


func _on_CreateButton_pressed(character_name_str, character_class_str):
	character_name_string = character_name_str
	character_class_string = character_class_str
	$UILayer/InventoryMgr.reset()
	$UILayer/InventoryMgr.update_list()
