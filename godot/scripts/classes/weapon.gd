extends Node2D
class_name Weapon


export var projectile : PackedScene


func fire(origin) -> void:
	var child = projectile.instance()
	child.rotation = $Muzzle.global_rotation
	child.global_position = $Muzzle.global_position
	child.origin = origin
	$"../../../Projectiles".add_child(child)
