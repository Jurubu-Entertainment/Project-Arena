extends Control


export(String, FILE, "*.tscn, *.scn") var target_scene: = ""

var transition : bool = false

func _physics_process(_delta) -> void:
	if Input.is_action_pressed("skip"):
		$AnimationPlayer.play("New Anim (2)")
	if transition:
		get_tree().get_current_scene().queue_free()
		var err = get_tree().change_scene(target_scene)
		if err != OK:
			print(ERR_CANT_OPEN, "ERR_CANT_OPEN", target_scene)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "New Anim (2)" or "New Anim":
		transition = true
