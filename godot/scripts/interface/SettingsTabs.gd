extends Control


var previous_tab : String = ""
var current_tab : String = "Gameplay"
var next_tab : String = ""

var tabs = ["Gameplay", "Audio", "Video", "Graphics", "Interface", "Controls", "Keymapping", "Accessibility"]


func _process(delta):
	_tab_key_switcher()


func _tab_hider(new_tab, old_tab):
	current_tab = new_tab
	
	var next_button : Button = get_node_or_null(str(new_tab,"Button"))
	next_button.pressed = true
	var previous_button : Button = get_node_or_null(str(old_tab, "Button"))
	previous_button.pressed = false
	
	var tab_to_show = get_node_or_null(str("../",new_tab,"Settings"))
	var tab_to_hide = get_node_or_null(str("../",old_tab,"Settings"))
	
	tab_to_show.show()
	tab_to_hide.hide()
	pass


func _tab_key_switcher():
	match current_tab:
		"Gameplay":
			current_tab = tabs[0]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[7], tabs[0])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[1], tabs[0])

		"Audio":
			current_tab[1]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[0], tabs[1])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[2], tabs[1])
		
		"Video":
			current_tab[2]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[1], tabs[2])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[3], tabs[2])
		
		"Graphics":
			current_tab[3]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[2], tabs[3])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[4], tabs[3])
		
		"Interface":
			current_tab[4]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[3], tabs[4])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[5], tabs[4])
		
		"Controls":
			current_tab[5]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[4], tabs[5])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[6], tabs[5])
		
		"Keymapping":
			current_tab[6]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[5], tabs[6])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[7], tabs[6])
		
		"Accessibility":
			current_tab[7]
			if Input.is_action_just_pressed("previous_tab"):
				_tab_hider(tabs[6], tabs[7])
			elif Input.is_action_just_pressed("next_tab"):
				_tab_hider(tabs[0], tabs[7])
		


func _switch_tab():
	previous_tab = current_tab
	current_tab = next_tab
	
	print(current_tab,"Button")
	var next_button : Button = get_node_or_null(str(current_tab, "Button"))
	next_button.pressed = true
	print(previous_tab,"Button")
	var previous_button : Button = get_node_or_null(str(previous_tab,"Button"))
	previous_button.pressed = false
	
	var next_ui_panel = get_node_or_null(str("../",current_tab,"Settings"))
	next_ui_panel.show()
	var previous_ui_panel = get_node_or_null(str("../",previous_tab,"Settings"))
	previous_ui_panel.hide()


func _on_GameplayButton_pressed():
	next_tab = tabs[0]
	if current_tab != next_tab:
		_switch_tab()


func _on_AudioButton_pressed():
	next_tab = tabs[1]
	if current_tab != next_tab:
		_switch_tab()


func _on_VideoButton_pressed():
	next_tab = "Video"
	if current_tab != next_tab:
		current_tab = next_tab


func _on_GraphicsButton_pressed():
	next_tab = "Graphics"
	if current_tab != next_tab:
		current_tab = next_tab


func _on_InterfaceButton_pressed():
	next_tab = "Interface"
	if current_tab != next_tab:
		current_tab = next_tab


func _on_ControlsButton_pressed():
	next_tab = "Controls"
	if current_tab != next_tab:
		current_tab = next_tab


func _on_KeymappingButton_pressed():
	next_tab = "Keymapping"
	if current_tab != next_tab:
		current_tab = next_tab


func _on_AccessibilityButton_pressed():
	next_tab = "Accessibility"
	if current_tab != next_tab:
		current_tab = next_tab
