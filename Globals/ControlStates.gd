extends Node


enum TYPES{
	KEYBOARD_MOUSE,
	GAMEPAD,
	TOUCHSCREEN
}

var type = TYPES.KEYBOARD_MOUSE

func _input(event):
	if event is InputEventMouse or event is InputEventKey:
		type = TYPES.KEYBOARD_MOUSE
	elif event is InputEventJoypadButton:
		type = TYPES.GAMEPAD
	elif event is InputEventScreenTouch:
		type = TYPES.TOUCHSCREEN
