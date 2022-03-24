extends KinematicBody2D
class_name Enemy


export(int, "Follow", "Don't Follow") var behavior
export var speed : float
export var attack_1 : String
export var attack_2 : String


onready var player : KinematicBody2D = get_node("../../Player/Player")
onready var anim_player = $AnimationPlayer


var random : RandomNumberGenerator = RandomNumberGenerator.new()

var player_close : bool = false
var origin
var attacking : bool = false
var has_attacked : bool = true
var current_attack : int

var motion = Vector2()


func _ready():
	origin = global_position


func _physics_process(delta):
	if is_instance_valid(player):
		look_at(player.global_position)
		
		if behavior == 0:
			if not player_close:
				position += transform.x * speed * delta
				#position += (player.position - position)/50
				
				move_and_slide(motion)
			
			if player_close:
				attacking = true
			else:
				attacking = false
		
		if attacking:
			if has_attacked:
				random.randomize()
				var num = random.randi_range(1,2)
				if num == 1:
					has_attacked = false
					anim_player.play(attack_1)
				if num == 2:
					has_attacked = false
					anim_player.play(attack_2)
		
	


func _on_Player_Proximity_body_entered(_body):
	player_close = true


func _on_Player_Proximity_body_exited(_body):
	player_close = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == attack_1 or attack_2:
		has_attacked = true
