tool
extends EditorPlugin

var button:Button
var label: Label
func _enter_tree() -> void:
	label = Label.new()
	label.text = "Bake sound map"
#	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, button)
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, label)

func _exit_tree() -> void:
	remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, label) # Remove the dock
#	remove_control_frdom_docks(button)
	label.free()
