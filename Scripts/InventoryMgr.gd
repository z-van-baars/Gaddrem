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
onready var character_name = "New Character"


func _on_NewItemPopup_add_new_item(item_stats):
	items[item_stats["Name"]] = item_stats
	update_list()


func reset():
	items = {}
	$CharacterNameLabel.text = character_name
	update_list()

func update_list():
	for each in $ItemTypes.get_children():
		each.queue_free()
	for each in $Quantities.get_children():
		each.queue_free()
	for each in $Names.get_children():
		each.queue_free()
	for each in $Weights.get_children():
		each.queue_free()
	for each in $Values.get_children():
		each.queue_free()
	for each in $Notes.get_children():
		each.queue_free()

	for each in items.keys():
		var new_icon = icon_scene.instance()
		$ItemTypes.add_child(new_icon)
		new_icon.get_node("Sprite").texture = item_icons[items[each]["Item Type"]]

		var quantity_label = entry_box_scene.instance()
		$Quantities.add_child(quantity_label)
		quantity_label.get_node("Label").text = str(items[each]["Quantity"])

		var new_label = entry_box_scene.instance()
		$Names.add_child(new_label)
		new_label.get_node("Label").text = each

		var weight_label = entry_box_scene.instance()
		$Weights.add_child(weight_label)
		weight_label.get_node("Label").text = str(items[each]["Weight"])

		var value_label = entry_box_scene.instance()
		$Values.add_child(value_label)
		value_label.get_node("Label").text = str(items[each]["Value"])

		var notes_label = entry_box_scene.instance()
		$Notes.add_child(notes_label)
		notes_label.get_node("Label").text = items[each]["Notes"]
		

func _on_AddItemButton_pressed():
	new_item_menu.show()

func _on_NewProfileMenu_new_profile(character_name_str, character_class_str):
	character_name = character_name_str
	reset()
