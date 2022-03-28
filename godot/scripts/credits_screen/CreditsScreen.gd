extends Node2D


export(String, FILE, "*.tscn, *.scn") var target_scene: = ""


func _on_BackButton_pressed() -> void:
	var err = get_tree().change_scene(target_scene)
	if err != OK:
		print(ERR_CANT_OPEN, "ERR_CANT_OPEN", target_scene)
