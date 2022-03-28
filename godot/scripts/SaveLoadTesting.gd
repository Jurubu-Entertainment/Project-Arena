extends Control


var fullscreen := false
var fullscreen_int = 1


onready var saver := $SaveLoad


func _ready() -> void:
	_invert_fullscreen(false)


func _invert_fullscreen(invert: bool) -> void:
	if invert:
		fullscreen_int = -fullscreen_int
	else:
		pass
	if fullscreen_int == 1:
		fullscreen = true
	else:
		fullscreen = false
	OS.window_fullscreen = fullscreen


func _load_settings() -> void:
	saver.load_data()
	_invert_fullscreen(false)


func _on_fullscreen_pressed() -> void:
	_invert_fullscreen(true)


func _on_save_pressed() -> void:
	saver.save_data()


func _on_load_pressed() -> void:
	saver.load_data()
	_load_settings()
