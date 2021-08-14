extends Control


func _ready():
	for button in $Buttons.get_children():
		button.connect("pressed", self, "change_scene" , [button.scenetoopen])


func change_scene(path):
	SceneChanger.change_scene(path)
