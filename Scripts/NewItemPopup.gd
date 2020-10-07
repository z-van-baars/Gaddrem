extends Control
signal add_new_item

onready var done_button_label = $DoneButton/Label

onready var fields = {
	"Name": $ItemNameField,
	"Quantity": $QuantityField,
	"Weight": $WeightField,
	"Value": $ValueField
}

onready var item_stats = {
	"Name": null,
	"Quantity": null,
	"Weight": null,
	"Value": null,
	"Item Type": "Misc",
	"Container": null,
	"Is Magical": false,
	"Notes": null}

func check_fields():
	if fields["Name"].text != "" and fields["Name"].text != null:
		item_stats["Name"] = fields["Name"].text
	else:
		return false
	if fields["Quantity"].text != "":
		item_stats["Quantity"] = int(fields["Quantity"].text)
	else:
		return false
	if fields["Weight"].text != "":
		item_stats["Weight"] = int(fields["Weight"].text)
	else:
		return false
	if fields["Value"].text != "":
		item_stats["Value"] = int(fields["Value"].text)
	else:
		return false
	item_stats["Notes"] = $NotesField.text
	return true

func _on_DoneButton_pressed():
	if check_fields() == true:
		emit_signal("add_new_item", item_stats)
		hide()
	for each in fields.keys():
		fields[each].clear()
	$MagicalButton/Label.visible = false
	item_stats = {
		"Name": null,
		"Quantity": null,
		"Weight": null,
		"Value": null,
		"Item Type": "Misc",
		"Container": null,
		"Is Magical": false,
		"Notes": null}


func _on_WeaponButton_pressed():
	item_stats["Item Type"] = "Weapon"

func _on_AmmunitionButton_pressed():
	item_stats["Item Type"] = "Ammunition"

func _on_ArmorButton_pressed():
	item_stats["Item Type"] = "Armor"

func _on_ContainerButton_pressed():
	item_stats["Item Type"] = "Container"

func _on_PotionButton_pressed():
	item_stats["Item Type"] = "Potion"

func _on_PoisonButton_pressed():
	item_stats["Item Type"] = "Poison"

func _on_FoodButton_pressed():
	item_stats["Item Type"] = "Food"

func _on_MiscButton_pressed():
	item_stats["Item Type"] = "Misc"

func _on_MagicalButton_pressed():
	item_stats["Is Magical"] = !item_stats["Is Magical"]
	$MagicalButton/Label.visible = !$MagicalButton/Label.visible


func _on_CancelButton_pressed():
	hide()
	for each in fields.keys():
		fields[each].clear()
	$MagicalButton/Label.visible


