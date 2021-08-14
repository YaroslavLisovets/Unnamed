extends "res://Characters/Character/Controller.gd"

var camera_rotation:Vector2 = Vector2.ZERO
var mouse_sensivity = .01
func _process(_delta):
	
	
	if Vector2(Input.get_joy_axis(Input.get_connected_joypads()[0], 2), Input.get_joy_axis(Input.get_connected_joypads()[0], 3)).length()>0.3:
		camera_rotation.y += Input.get_joy_axis(0, 2) * mouse_sensivity
		camera_rotation.x += Input.get_joy_axis(0, 3) * mouse_sensivity
		camera_rotation.x = clamp(camera_rotation.x, -0.5, 0.5)
	
	input_vector.x = Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	input_vector.y = Input.get_action_strength("go_backward") - Input.get_action_strength("go_forward")
	input_vector = input_vector.rotated(-camera_rotation.y)
	if input_vector:
		input_rotation = -input_vector.angle()-PI/2

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera_rotation.x -= event.relative.y * mouse_sensivity
		camera_rotation.y -= event.relative.x * mouse_sensivity
		camera_rotation.x = clamp(camera_rotation.x, -0.5, 0.5)
	
		

