extends KinematicBody

onready var controller := $Controller

var _velocity:Vector3 = Vector3.ZERO

var _speed:float = 10.0

var can_interact := true
func _move():
	_velocity = move_and_slide(Vector3(controller.wished_movement.x, 0.0, controller.wished_movement.y).normalized()*_speed)
	
	
func _rotate(_delta:float = 0.0):
	rotation.y = lerp_angle(rotation.y, controller.wished_rotation, .125/2)
	
func _physics_process(delta):
	_move()
	_rotate(delta)
