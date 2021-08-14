extends "res://Characters/Character/Character.gd"

onready var camera := $Container/CameraPivot/Camera
onready var camera_pivot := $Container/CameraPivot


func _physics_process(delta):
	._physics_process(delta)
	camera_pivot.rotation.x = _controller.camera_rotation.x
	camera_pivot.rotation.y = _controller.camera_rotation.y
	
