tool
extends Area

export(NodePath) onready var interactive_object_path setget set_interact_object

func set_interact_object(path:NodePath):
	var node:=get_node_or_null(path)
	if  not node or node.has_method("activate"):
		interactive_object_path = path
	else:
		printerr("Node %s don't have 'activate' method" %[path])

func activate(_area):
	if not interactive_object_path or interactive_object_path.is_empty():
		return
	get_node(interactive_object_path).call("activate")


func _object_enntered(area):
	activate(area)
	
	print(area.get_name())



func _object_exited(_area):
	print("Body exited")
	

