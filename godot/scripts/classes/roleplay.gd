extends Node2D
class_name Roleplay

export var health : int

onready var anim : AnimationPlayer = $"../Skeleton/Animations"
onready var death_anim : AnimationPlayer = $"../Skeleton/Death"

func _ready():
	death_anim.connect("animation_finished", self, "_death_anim_finished")


func damage(damage):
	if health > 0:
		health -= damage
	else:
		death_anim.play("death")
		pass
	pass


func _death_anim_finished(anim_name):
	if anim_name == "death":
		owner.queue_free()
