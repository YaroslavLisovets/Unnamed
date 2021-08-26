extends "res://Characters/Character/Character.gd"
class_name Player




onready var camera := $Container/CameraPivot/Camera
onready var camera_pivot := $Container/CameraPivot
onready var animation_tree := $AnimationTree
export(Curve) var speed_curve:Curve


func _ready() -> void:
	(controller as PlayerController).connect("shoot", self, "shoot")

func shoot() -> void:
	print("shoot")


func _physics_process(delta):
	._physics_process(delta)
	camera_pivot.rotation.x = controller.camera_rotation.x
	camera_pivot.rotation.y = controller.camera_rotation.y
	#animation_tree.set("parameters/strafe/blend_position", (controller.wished_movement as Vector2).normalized().rotated(controller.wished_rotation))
	animation_tree.set("parameters/BlendSpace1D/blend_position",(controller.wished_movement as Vector2).length())
	
	animation_tree.set("parameters/strafe_speed/scale",min(1, _velocity.length()/3))
	#print(-1 * controller.wished_movement.normalized())

func _move():
#	print((controller.wished_movement as Vector2).length())
	_speed = speed_curve.interpolate((controller.wished_movement as Vector2).length())
	._move()
