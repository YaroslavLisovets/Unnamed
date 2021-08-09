tool
extends Area

export(NodePath) onready var interactive_object_path setget set_interact_object

func set_interact_object(path:NodePath):
	if not path or path.is_empty() or not get_node(path):
		interactive_object_path = path
		return
	if get_node(path).has_method("activate"):
		interactive_object_path = path
	else:
		printerr("Node %s don't have 'activate' method" %[path])

func activate(area):
	if not interactive_object_path or interactive_object_path.is_empty():
		return
	get_node(interactive_object_path).call("activate")


func _object_enntered(area):
	activate(area)
	
	print(area.get_name())
	pass # Replace with function body.


func _object_exited(_area):
	print("Body exited")
	
	pass # Replace with function body.
