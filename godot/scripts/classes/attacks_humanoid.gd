extends Node2D
class_name Humanoid_Attacks

export var melee_dmg: int

onready var anim : AnimationPlayer = $"../Skeleton/Animations"
onready var roleplay : Roleplay = $"../Roleplay"

var random : RandomNumberGenerator = RandomNumberGenerator.new()

var melee_targets : Array

func melee():
	melee_targets.clear()
	var current_anim : String = anim.current_animation
	random.randomize()
	if not current_anim.begins_with("melee"):
		var r_num = random.randi_range(1,2)
		anim.play(str("melee_",r_num))


func melee_damage():
	for node in melee_targets:
		if node != owner:
			if node.has_method("damage"):
				node.damage(melee_dmg)




func _on_Melee_area_entered(body):
	if body != roleplay:
		if body.has_method("damage"):
			body.damage(melee_dmg)
