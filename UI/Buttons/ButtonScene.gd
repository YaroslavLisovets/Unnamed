extends Button

export(PackedScene) var scene_to_open


func _ready() -> void:
	if scene_to_open:
		connect("pressed", get_tree(), "change_scene_to", [scene_to_open])
