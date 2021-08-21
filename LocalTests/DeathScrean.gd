extends Control

func _ready():
	var b = $Button
	b.connect("pressed", self, "change_stage", [b.scenetoopen])


func change_stage(path):
	SceneChanger.change_stage(path)
