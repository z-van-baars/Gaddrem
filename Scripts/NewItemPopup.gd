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
	item_stats = {
		"Name": null,
		"Quantity": null,
		"Weight": null,
		"Value": null,
		"Item Type": "Misc",
		"Notes": null}


func _on_WeaponButton_pressed():
	item_stats["Item Type"] = "Weapon"

func _on_ArmorButton_pressed():
	item_stats["Item Type"] = "Armor"

func _on_ContainerButton_pressed():
	item_stats["Item Type"] = "Container"

func _on_PotionButton_pressed():
	item_stats["Item Type"] = "Potion"

func _on_MiscButton_pressed():
	item_stats["Item Type"] = "Misc"
