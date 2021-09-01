extends KinematicBody

onready var _controller := $Controller

var _velocity:Vector3 = Vector3.ZERO

var _speed:float = 10.0

var can_interact := true
func _move():
	_velocity = move_and_slide(Vector3(_controller.input_vector.x, 0.0, _controller.input_vector.y).normalized()*_speed)
	
	
func _rotate(_delta:float = 0.0):
	rotation.y = lerp_angle(rotation.y, _controller.input_rotation, .125/2)
	
func _physics_process(delta):
	_move()
	_rotate(delta)


