extends Control

func _ready() -> void:
	$Button.connect("pressed", get_tree(), 'quit')


#func change_stage(path:PackedScene):
#	get_tree().change_scene_to(path)
