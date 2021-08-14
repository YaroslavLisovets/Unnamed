extends KinematicBody


onready var camera:Camera = get_viewport().get_camera()


var SPEED = 15

var _input_vector := Vector2.ZERO
var _velocitry := Vector2.ZERO

onready var skeleton_ik :SkeletonIK = $Arm/Armature/Skeleton/SkeletonIK
func _turn_to_mouse():
	var angle = (get_viewport().size/2).angle_to_point(get_viewport().get_mouse_position()) - PI / 2 #PI/2 необходима так как персонаж изначально повёрнут на 90°
	rotation.y = -angle
	camera.rotation.y = angle
	

func _update_input_vector():
	_input_vector.y =  Input.get_action_strength("go_backward") - Input.get_action_strength("go_forward")
	_input_vector.x =  Input.get_action_strength("go_right") - Input.get_action_strength("go_left") 
	
#	print(Input.get_action_strength("ui_up"),  Input.get_action_strength("ui_down"))
#	print(Input.get_action_strength("ui_left"),  Input.get_action_strength("ui_right"))
	

func _process(_delta):
	_update_input_vector()
	_turn_to_mouse()
	
	

func _physics_process(_delta):
	_move_character()

func _move_character():
	_velocitry = _input_vector * SPEED
	var velocity3 = move_and_slide(Vector3(_velocitry.x, 0, _velocitry.y))
	_velocitry.x = velocity3.x
	_velocitry.y = velocity3.z



