extends CanvasLayer


export(String, FILE, '*.tscn, *.scn') var target_scene: = ''


onready var start_menu = $Title_Screen_Menu/Overlay/Start_Menu
onready var qtd_menu = $Title_Screen_Menu/Overlay/QTD_Menu
onready var options_menu = $Title_Screen_Menu/Overlay/Options_Menu
