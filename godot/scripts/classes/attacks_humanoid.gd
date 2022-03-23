extends Node2D
class_name Humanoid_Attacks

export var melee_dmg: int

onready var anim : AnimationPlayer = $"../Skeleton/Animations"
onready var roleplay : Roleplay = $"../Roleplay"
onready var weapon : Weapon = $"../Weapon"

var random : RandomNumberGenerator = RandomNumberGenerator.new()

var melee_targets : Array
var attacking : bool = false

var current_weapon : String = "rifle"

func _ready():
	anim.connect("animation_finished",self,"_on_anim_animation_finished")


func _physics_process(delta):
	if not attacking:
		if current_weapon == "rifle":
			anim.play("rifle_default")


func melee():
	melee_targets.clear()
	var current_anim : String = anim.current_animation
	random.randomize()
	if not current_anim.begins_with("melee"):
		var r_num = random.randi_range(1,2)
		attacking = true
		anim.play(str("melee_",r_num))


func melee_damage():
	for node in melee_targets:
		if node != owner:
			if node.has_method("damage"):
				node.damage(melee_dmg)

func fire_primary():
	attacking = true
	anim.play("fire_primary_two_handed")

func fire_current_weapon():
	if current_weapon == "rifle":
		weapon.fire()


func _on_Melee_area_entered(body):
	if body != roleplay:
		if body.has_method("damage"):
			body.damage(melee_dmg)


func _on_anim_animation_finished(anim_name: String):
	if anim_name.begins_with("melee") or anim_name.begins_with("fire"):
		attacking = false
