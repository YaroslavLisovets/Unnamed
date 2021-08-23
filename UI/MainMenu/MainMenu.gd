extends Control

onready var animator := $Background/CameraAnimator

func _start_button_focused() -> void:
	animator.play("StartButtonCameraTransition")

func _start_button_unfocused() -> void:
	animator.play_backwards('StartButtonCameraTransition')
