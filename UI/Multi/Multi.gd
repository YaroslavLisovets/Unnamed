extends Control

onready var animator := $Background/CameraAnimator

func _start_button_show1() -> void:
	animator.play("StartButtonCameraTransition")

func _start_button_unshow1() -> void:
	animator.play_backwards('StartButtonCameraTransition')

func _start_button_show2() -> void:
	animator.play("StartButtonCameraTransition")

func _start_button_unshow2() -> void:
	animator.play_backwards('StartButtonCameraTransition')
