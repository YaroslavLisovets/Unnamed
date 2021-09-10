extends KinematicBody

onready var _controller := $Controller

var _velocity:Vector3 = Vector3.ZERO
onready var animation_tree := $AnimationTree
var _speed:float = 10.0
export(Curve) var speed_curve:Curve

var can_interact := true

func _move():
	_speed = speed_curve.interpolate((_controller.input_vector as Vector2).length())
	_velocity = move_and_slide(Vector3(_controller.input_vector.x, 0.0, _controller.input_vector.y).normalized()*_speed)
	
func _rotate(delta:float = 0.0):
	rotation.y = lerp_angle(rotation.y, _controller.input_rotation, delta * 5 )
	
func _physics_process(delta):
	_rotate(delta)	
	_move()
	_animate()
	
func _animate():
	animation_tree.set("parameters/BlendSpace1D/blend_position",-(_controller.input_vector as Vector2).rotated(rotation.y).y)

