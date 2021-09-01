extends "res://Characters/Character/Character.gd"
class_name Player
onready var camera := $Container/CameraPivot/Camera
onready var camera_pivot := $Container/CameraPivot
onready var animation_tree := $AnimationTree
export(Curve) var speed_curve:Curve

func _physics_process(delta):
	._physics_process(delta)
	camera_pivot.rotation.x = _controller.camera_rotation.x
	camera_pivot.rotation.y = _controller.camera_rotation.y
	#animation_tree.set("parameters/strafe/blend_position", (_controller.input_vector as Vector2).normalized().rotated(_controller.input_rotation))
	animation_tree.set("parameters/BlendSpace1D/blend_position",(_controller.input_vector as Vector2).length())
	
	animation_tree.set("parameters/strafe_speed/scale",min(1, _velocity.length()/3))
	
func _move():
#	print((_controller.input_vector as Vector2).length())
	_speed = speed_curve.interpolate((_controller.input_vector as Vector2).length())
	._move()

