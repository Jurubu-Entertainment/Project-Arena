extends KinematicBody2D
class_name Projectile


export var speed = 1000
export var damage : int = 5


var velocity = Vector2()
var enemy_hit : bool = false
var origin
var start_color : Color = Color(1,1,1,1)
var end_color : Color = Color(1,1,1,0)


onready var timer : Timer = $Timer
onready var tween : Tween = $Tween
onready var area : Area2D = $Area2D


func _physics_process(delta) -> void:
	if not enemy_hit:
		velocity = Vector2(speed, 0).rotated(rotation)
		move_and_slide(velocity)


func _on_Timer_timeout() -> void:
	tween.interpolate_property(self, "modulate", start_color, end_color, 2, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	tween.start()


func _on_Tween_tween_completed(_object, _key) -> void:
	queue_free()


func _on_Area2D_body_entered(body) -> void:
	if body.has_method("damage"):
		if not enemy_hit:
			if body != origin:
				body.damage(damage)
				enemy_hit = true
				tween.interpolate_property(self, "modulate", start_color, end_color, 2, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
				tween.start()
