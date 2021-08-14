extends "res://Enviroment/InteractZone/InteractZone.gd"

const Player = preload("res://LocalTests/PlayerScript.gd")



func activate(area:Player):
	area.skeleton_ik.set_target_node($CSGCylinder/IKPosition.get_path())
	area.skeleton_ik.start()
	$Tween.interpolate_property(area.skeleton_ik, "interpolation", 0, 1, 0.25)
	$Tween.start()
	yield($Tween, "tween_completed")
	$AnimationPlayer.play("push_button")
	
	yield($AnimationPlayer, "animation_finished")
	.activate(area)
	$Tween.interpolate_property(area.skeleton_ik, "interpolation", 1, 0, 0.25)
	$Tween.start()
	yield($Tween, "tween_completed")
	
	area.skeleton_ik.stop()
	area.skeleton_ik.interpolation = 0
	
	
	
	
	



