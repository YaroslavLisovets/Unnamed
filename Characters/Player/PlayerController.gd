extends "res://Characters/Character/Controller.gd"
class_name PlayerController
var camera_rotation:Vector2 = Vector2.ZERO
var sensivity = .0075
var joy_deadzone = 0.3

var min_camera_offset = -0.5
var max_camera_offset = 1.5

var _print_instance = _print_message_with_frames_delay(15)

func _process(delta)->void:
	if GlobalStates.type == GlobalStates.TYPES.KEYBOARD_MOUSE:
		_handle_keyboard()
	elif GlobalStates.type == GlobalStates.TYPES.GAMEPAD:
		_handle_joy_motion()
	
	input_vector.clamped(1.0)
	input_vector = input_vector.rotated(-camera_rotation.y)#Изменение получаемого вектора движение отностильно
	if input_vector:#проверка если вектор управления не нулевой, для правильно поворота персонажа по вектору движения движения
		input_rotation = -input_vector.angle()-PI/2 #изменение поворота персонажа + добавления PI/2 из за изначального  смещения персонажа
	


func _handle_keyboard():
	
	input_vector.x = float(Input.is_action_pressed("go_right")) - float(Input.is_action_pressed("go_left"))
	input_vector.y = float(Input.is_action_pressed("go_backward")) - float(Input.is_action_pressed("go_forward"))
func _handle_joy_motion():
	input_vector.x = Input.get_joy_axis(0, 0)
	input_vector.y = Input.get_joy_axis(0, 1)
	
	input_vector = input_vector if input_vector.length() > joy_deadzone else Vector2.ZERO#TODO remove new instance creating

	if Input.get_connected_joypads() and  Vector2(Input.get_joy_axis(Input.get_connected_joypads()[GlobalStates.joy_id], 2),
	 Input.get_joy_axis(Input.get_connected_joypads()[GlobalStates.joy_id], 3)).length() > joy_deadzone:
		"""" Проверка: Больше ли слепой зоны отклоние правого стика  """
		
		camera_rotation.y -= Input.get_joy_axis(0, 2) * sensivity
		camera_rotation.x += Input.get_joy_axis(0, 3) * sensivity 
		_clamp_camera()
	
func _clamp_camera():
	camera_rotation.x = clamp(camera_rotation.x, min_camera_offset, max_camera_offset)
	

func _print_message_with_frames_delay(restart_frame: float)->void:
	var frames:int = 0
	while true:
		yield()
#		frames =  wrapi(frames + 1, 0, frames)
		frames += 1
		if frames == restart_frame - 1:
#			print("True length: ", sqrt(input_vector.x * input_vector.x+input_vector.y*input_vector.y))
#			print("Vector legth: ", input_vector.length())
		
#			print("Vector legth: ", input_vector.distance_to(Vector2.ZERO))
			
			frames = 0
		

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera_rotation.x -= event.relative.y * sensivity
		camera_rotation.y -= event.relative.x * sensivity
		_clamp_camera()

