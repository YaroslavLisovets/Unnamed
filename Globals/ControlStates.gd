extends Node


enum TYPES{
	KEYBOARD_MOUSE,
	GAMEPAD,
	TOUCHSCREEN
}



var type = TYPES.KEYBOARD_MOUSE

onready var joy_id = Input.get_connected_joypads()[0] if Input.get_connected_joypads() else -1

func _ready():
	print(Input.get_connected_joypads())
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var __ = Input.connect("joy_connection_changed", self, "_joy_connection_changed")

func _joy_connection_changed(device: int, connected: bool):
	if connected:
		joy_id = device
	elif joy_id == device:
		joy_id = -1
		

func _input(event):
	if event.is_action_pressed("to_menu"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif typeof(event) in [InputEventMouse, InputEventKey]:
		type = TYPES.KEYBOARD_MOUSE
	elif typeof(event) in [typeof(InputEventJoypadButton), typeof(InputEventJoypadMotion)] :
		type = TYPES.GAMEPAD
	elif event is InputEventScreenTouch:
		type = TYPES.TOUCHSCREEN
	
