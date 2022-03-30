extends Node2D
class_name Roleplay


export var is_player := false
export var health : int
export var blood_splatter : PackedScene
export var blood_color : Color
export var blood_swell_size : float


var rng_death_sprite := RandomNumberGenerator.new()


onready var anim := $"../HumanoidSkeleton/Animations"


func damage(damage) -> void:
	if health > 0:
		health -= damage
	else:
		if is_player:
			$"../Skeleton".hide()
			var node = blood_splatter.instance()
			node.color = blood_color
			node.size = blood_swell_size
			$"../../../Decals".add_child(node)
			node.global_position = self.global_position
		else:
			owner.queue_free()
			var node = blood_splatter.instance()
			node.color = blood_color
			node.size = blood_swell_size
			$"../../../Decals".add_child(node)
			node.global_position = self.global_position


func _death_anim_finished(anim_name) -> void:
	if anim_name == "death":
		pass
