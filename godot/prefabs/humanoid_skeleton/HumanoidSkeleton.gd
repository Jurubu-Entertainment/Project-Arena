extends Skeleton2D

export var is_player := false
export var animation : PoolStringArray
export var animation_node : NodePath


var rs_look = Vector2(0,0)
var use_gamepad := false
var deadzone


onready var gun : Node2D = $Gun
onready var head : Bone2D = $Head
onready var anim := get_node(animation_node)


func _ready():
	match is_player:
		true:
			use_gamepad = owner.use_gamepad
			deadzone = owner.deadzone


func _play_anim(anim_name):
	if anim_name != anim.current_animation:
		anim.play(anim_name)


func _physics_process(delta) -> void:
	match is_player:
		true:
			_look()


func _look():
	if not use_gamepad:
		var mouse_pos = get_global_mouse_position()
		owner.look_at(mouse_pos)
		head.look_at(mouse_pos)
	if use_gamepad:
		
		rs_look.y = Input.get_joy_axis(0, JOY_AXIS_3)
		rs_look.x = Input.get_joy_axis(0, JOY_AXIS_2)
		if rs_look.length() >= deadzone:
			rotation = rs_look.angle()
		
		var gamepad_gun_rotate_point : RayCast2D = $RayCast2D
		var point = gamepad_gun_rotate_point.get_collision_point()
		if not gamepad_gun_rotate_point.is_colliding():
			gun.rotation_degrees = 0
