extends CanvasLayer


export(String, FILE, '*.tscn, *.scn') var target_scene: = ""


var credits_screen = "res://scenes/title_screen/credits_screen.tscn"


onready var start_menu = $Title_Screen_Menu/Overlay/Start_Menu
onready var qtd_menu = $Title_Screen_Menu/Overlay/QTD_Confirmation
onready var options_menu = $Title_Screen_Menu/Overlay/Options_Menu


func _on_Start_Button_pressed():
	get_tree().get_current_scene().queue_free()
	var err = get_tree().change_scene(target_scene)
	if err != OK:
		print(ERR_CANT_OPEN, "ERR_CANT_OPEN", target_scene)


func _on_Options_Button_pressed():
	$Title_Screen_Menu/Overlay/Start_Menu.hide()
	$Title_Screen_Menu/Overlay/Options_Menu.show()


func _on_Back_Button_pressed():
	$Title_Screen_Menu/Overlay/Start_Menu.show()
	$Title_Screen_Menu/Overlay/Options_Menu.hide()


func _on_Credits_Button_pressed():
	get_tree().get_current_scene().queue_free()
	var err = get_tree().change_scene(credits_screen)
	if err != OK:
		print(ERR_CANT_OPEN, "ERR_CANT_OPEN", credits_screen)


func _on_Quit_Button_pressed():
	$Title_Screen_Menu/Overlay/Start_Menu.hide()
	$Title_Screen_Menu/Overlay/QTD_Confirmation.show()


func _on_Yes_Button_pressed():
	get_tree().quit()


func _on_No_Button_pressed():
	$Title_Screen_Menu/Overlay/Start_Menu.show()
	$Title_Screen_Menu/Overlay/QTD_Confirmation.hide()
