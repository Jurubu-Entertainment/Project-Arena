extends CanvasLayer


export(String, FILE, "*.tscn, *.scn") var target_scene: = ""


# Node Path Variables
onready var backdrop = $Backdrop
onready var godot_logo = $Backdrop/Godot_Logo
onready var scene_transition_rect = $Scene_Transition_Rect
onready var transition_player = $Scene_Transition_Rect/Transition_Player
onready var transition_timer = $Transition_Timer


func _ready() -> void:
	Scene_Setup()


# When scene is loaded, set all nodes to be shown or hidden as necessary
func Scene_Setup() -> void:
	backdrop.show()
	godot_logo.show()
	scene_transition_rect.show()


# If "skip" input is pressed, start Transition_Player's "Fade_Out" animation
func _physics_process(_delta) -> void:
	if Input.is_action_pressed("skip"):
		transition_player.play("Fade_Out")


# Start Transition_Timer when Splash_Player's animation is finished
func _on_Splash_Player_animation_finished(_anim_name: String) -> void:
	transition_timer.start()


# Start Transition_Timer when Transition_Player's animation is finished
func _on_Transition_Player_animation_finished(_anim_name) -> void:
	transition_timer.start()


# Upon Transition_Timer timeout, change scene to target_scene
func _on_Transition_Timer_timeout() -> void:
	get_tree().get_current_scene().queue_free()
	var err = get_tree().change_scene(target_scene)
	if err != OK:
		print(ERR_CANT_OPEN, "ERR_CANT_OPEN", target_scene)
