extends KinematicBody2D

export var speed : float

onready var tween : Tween = $Tween
onready var dodge_timer : Timer = $Dodge_Cooldown
onready var trail : Particles2D = $Trail
onready var gun : Node2D = $Gun
onready var attacks : Humanoid_Attacks = $Attacks_Humanoid

var _velocity : Vector2 = Vector2.ZERO

var direction = null
var origin = null
var new_pos = null
var can_dodge: bool = true
var dodging : bool = false

var use_gamepad : bool = false
var rs_look = Vector2(0,0)
var deadzone = 0.3


func _ready():
	OS.window_fullscreen = true
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")

func _physics_process(_delta):
	look()
	fighting()
	
	var left = Input.get_action_strength("ui_left")
	var right = Input.get_action_strength("ui_right")
	var up = Input.get_action_strength("ui_up")
	var down = Input.get_action_strength("ui_down")
	
	var dodge = Input.is_action_just_pressed("ui_accept")
	
	if dodge and can_dodge:
		if not direction == Vector2(0,0):
			trail.emitting = true
			can_dodge = false
			dodging = true
			origin = global_position
			_velocity = move_and_slide(direction * speed * 120)
			new_pos = global_position
			global_position = origin
			tween.interpolate_property(self, "global_position", origin,new_pos,0.15, tween.TRANS_LINEAR,tween.EASE_OUT_IN)
			tween.start()
			dodge_timer.start()
	
	
	if not dodging:
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		_velocity = move_and_slide(direction * speed)


func look():
	if not use_gamepad:
		look_at(get_global_mouse_position())
		gun.look_at(get_global_mouse_position())
	if use_gamepad:
		rslook()
		var gamepad_gun_rotate_point : RayCast2D = $RayCast2D
		var point = gamepad_gun_rotate_point.get_collision_point()
		if not gamepad_gun_rotate_point.is_colliding():
			gun.rotation_degrees = 0
		else:
			gun.look_at(point)


func fighting():
	if Input.is_action_pressed("melee_attack"):
		attacks.melee()
	
	pass


func rslook():
	rs_look.y = Input.get_joy_axis(0, JOY_AXIS_3)
	rs_look.x = Input.get_joy_axis(0, JOY_AXIS_2)
	if rs_look.length() >= deadzone:
		rotation = rs_look.angle()


func _on_Dodge_Cooldown_timeout():
	can_dodge = true


func _on_Tween_tween_completed(_object, _key):
	dodging = false
	trail.emitting = false

func _on_joy_connection_changed(device_id, connected):
	if connected:
		use_gamepad = true
		print(Input.get_joy_name(device_id))
	else:
		use_gamepad = false
		print("Keyboard")
