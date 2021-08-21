extends Control

onready var animttor:= $"/root/MainBack/Camera/AnimationPlayer"

func _ready():
	for button in $Buttons.get_children():
		button.connect("mouse_entered", self, "Animation1")
		button.connect("mouse_exited", self, "Animation2")
		button.connect("pressed", self, "change_scene" , [button.scenetoopen])


func change_scene(path):
	SceneChanger.change_scene(path)

func Animation1():
	animttor.play('Переход №2')
func Animation2():
	animttor.play_backwards('Переход №2')
