extends Control

onready var entry_box_scene = preload("res://EntryBox.tscn")
onready var icon_scene = preload("res://TypeIcon.tscn")
onready var new_item_menu = get_tree().root.get_node("Main/UILayer/NewItemPopup")
onready var item_icons = {
	"Weapon": load("res://Assets/Icons/weapon.png"),
	"Armor": load("res://Assets/Icons/weapon.png"),
	"Container": load("res://Assets/Icons/container.png"),
	"Potion": load("res://Assets/Icons/potion.png"),
	"Misc": load("res://Assets/Icons/misc.png")}
onready var items = {}
onready var character_name_string = "New Character"
onready var character_class_string = " "


func _on_NewItemPopup_add_new_item(item_stats):
	items[item_stats["Name"]] = item_stats
	update_list()


func reset():
	items = {}
	character_name_string = " "
	character_class_string = " "
	for each in $StatColumns/ItemTypes.get_children():
		each.queue_free()
	for each in $StatColumns/Quantities.get_children():
		each.queue_free()
	for each in $StatColumns/Names.get_children():
		each.queue_free()
	for each in $StatColumns/Weights.get_children():
		each.queue_free()
	for each in $StatColumns/Values.get_children():
		each.queue_free()
	for each in $StatColumns/Containers.get_children():
		each.queue_free()
	for each in $StatColumns/Notes.get_children():
		each.queue_free()

func update_list():
	$CharacterNameLabel.text = character_name_string + " - " + character_class_string

	for each in items.keys():
		var new_icon = icon_scene.instance()
		$StatColumns/ItemTypes.add_child(new_icon)
		new_icon.get_node("Sprite").texture = item_icons[items[each]["Item Type"]]

		var quantity_label = entry_box_scene.instance()
		$StatColumns/Quantities.add_child(quantity_label)
		quantity_label.get_node("Label").text = str(items[each]["Quantity"])

		var new_label = entry_box_scene.instance()
		$StatColumns/Names.add_child(new_label)
		new_label.get_node("Label").text = each

		var weight_label = entry_box_scene.instance()
		$StatColumns/Weights.add_child(weight_label)
		weight_label.get_node("Label").text = str(items[each]["Weight"])

		var value_label = entry_box_scene.instance()
		$StatColumns/Values.add_child(value_label)
		value_label.get_node("Label").text = str(items[each]["Value"])
		
		var container_label = entry_box_scene.instance()
		$StatColumns/Containers.add_child(container_label)
		if items[each]["Container"] == null:
			container_label.get_node("Label").text = " - "
		else:
			container_label.get_node("Label").text = str(items[each]["Container"])

		var notes_label = entry_box_scene.instance()
		$StatColumns/Notes.add_child(notes_label)
		notes_label.get_node("Label").text = items[each]["Notes"]
		

func _on_AddItemButton_pressed():
	new_item_menu.show()

func _on_NewProfileMenu_new_profile(character_name_str, character_class_str):
	character_name_string = character_name_str
	character_class_string = character_class_str
	reset()
