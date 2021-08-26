extends "res://Characters/Character/Controller.gd"
class_name PlayerController

signal shoot
signal reload

var camera_rotation:Vector2 = Vector2.ZERO
var sensivity = .0075
var joy_deadzone = 0.3

var min_camera_offset = -0.5
var max_camera_offset = 1.5

var _print_instance = _print_message_with_frames_delay(15)

func _process(_delta)->void:
	if GlobalStates.type == GlobalStates.TYPES.KEYBOARD_MOUSE:
		_handle_keyboard()
	elif GlobalStates.type == GlobalStates.TYPES.GAMEPAD:
		_handle_joy_motion()
	
	wished_movement = wished_movement.clamped(1.0)
	wished_movement = wished_movement.rotated(-camera_rotation.y)#Изменение получаемого вектора движение отностильно
	if wished_movement:#проверка если вектор управления не нулевой, для правильно поворота персонажа по вектору движения движения
		wished_rotation = -wished_movement.angle()-PI/2 #изменение поворота персонажа + добавления PI/2 из за изначального  смещения персонажа
	


func _handle_keyboard():
	
	wished_movement.x = float(Input.is_action_pressed("go_right")) - float(Input.is_action_pressed("go_left"))
	wished_movement.y = float(Input.is_action_pressed("go_backward")) - float(Input.is_action_pressed("go_forward"))
func _handle_joy_motion():
	wished_movement.x = Input.get_joy_axis(0, 0)
	wished_movement.y = Input.get_joy_axis(0, 1)
	
	wished_movement = wished_movement if wished_movement.length() > joy_deadzone else Vector2.ZERO#TODO remove new instance creating

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
		frames += 1
		if frames == restart_frame - 1:
#			print("True length: ", sqrt(wished_movement.x * wished_movement.x+wished_movement.y*wished_movement.y))
#			print("Vector legth: ", wished_movement.length())
		
#			print("Vector legth: ", wished_movement.distance_to(Vector2.ZERO))
			
			frames = 0
		

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera_rotation.x -= event.relative.y * sensivity
		camera_rotation.y -= event.relative.x * sensivity
		_clamp_camera()
	elif event.is_action_pressed("shoot"):
		emit_signal("shoot")
	elif event.is_action_pressed("reload"):
		emit_signal("reload")
