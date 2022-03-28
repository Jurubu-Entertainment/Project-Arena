extends Node2D
class_name Humanoid_Attacks


export var melee_dmg: int
export var target : String
export(int, LAYERS_2D_PHYSICS) var collide_layer


var random : RandomNumberGenerator = RandomNumberGenerator.new()

var melee_targets : Array
var attacking : bool = false

var current_weapon : String = "rifle"


onready var anim : AnimationPlayer = $"../HumanoidSkeleton/Animations"
onready var roleplay : Roleplay = $"../Roleplay"
onready var weapon : Weapon = $"../Weapon"


func _ready() -> void:
	anim.connect("animation_finished",self,"_on_anim_animation_finished")


func _physics_process(delta) -> void:
	if roleplay.health > 0:
		if not attacking:
			if current_weapon == "rifle":
				anim.play("rifle_default")


func melee() -> void:
	melee_targets.clear()
	var current_anim : String = anim.current_animation
	random.randomize()
	if not current_anim.begins_with("melee"):
		var r_num = random.randi_range(1,2)
		attacking = true
		anim.play(str("melee_",r_num))


func melee_damage() -> void:
	for node in melee_targets:
		if node != owner:
			if node.has_method("damage"):
				node.damage(melee_dmg)


func fire_primary() -> void:
	attacking = true
	anim.play("fire_primary_two_handed")


func fire_current_weapon() -> void:
	if current_weapon == "rifle":
		weapon.fire(owner)


func _on_Melee_area_entered(body) -> void:
	if body != roleplay:
		if body.has_method("damage"):
			body.damage(melee_dmg)


func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name.begins_with("melee") or anim_name.begins_with("fire"):
		attacking = false
