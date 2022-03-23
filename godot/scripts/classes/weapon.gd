extends Node2D
class_name Weapon


export var projectile : PackedScene

func fire():
	var child = projectile.instance()
	$Muzzle.look_at(get_global_mouse_position())
	child.rotation = $Muzzle.global_rotation
	child.global_position = $Muzzle.global_position
	$"../../../Projectiles".add_child(child)
