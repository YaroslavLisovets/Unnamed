extends Spatial

func activate():
	$AnimationPlayer.play("Open_Close")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play_backwards("Open_Close")
