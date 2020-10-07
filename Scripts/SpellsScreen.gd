extends Control

func reset():
	pass

func update():
	$CharacterNameLabel.text = get_tree().root.get_node("Main").character_name_string + " - "
	$CharacterNameLabel.text += get_tree().root.get_node("Main").character_class_string
