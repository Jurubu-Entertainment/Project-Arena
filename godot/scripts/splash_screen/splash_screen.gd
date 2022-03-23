extends Control

@export var target : PackedScene

@onready var anim : AnimationPlayer = $AnimationPlayer

var transition : bool = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("skip"):
		anim.play("fade")
	if transition:
		var err = get_tree().change_scene_to(target)
		if err != OK:
			pass
		pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade" or anim_name == "start":
		transition = true
