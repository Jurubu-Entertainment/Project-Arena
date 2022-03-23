extends Skeleton2D

func _process(delta):
	var lefthand = $Leftarm/Forearm/Hand
	var righthand = $Rightarm/Forearm/Hand

	lefthand.global_transform = $Position2D.global_transform
	
	$Position2D.global_position = get_global_mouse_position()
	pass
