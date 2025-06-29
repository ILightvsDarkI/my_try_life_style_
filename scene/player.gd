extends RigidBody3D

var mouse_sensetivity := 0.01
var twist_input := 0.0
var pitch_input := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("Mouse position: ", get_viewport().get_mouse_position())

	var input := Vector3.ZERO
	input.z = Input.get_axis("move_forward","move_back")
	input.x = Input.get_axis("move_left","move_right") 
	# move_left = -1.0, move_right = 1.0 ,move_left + move_right = 0.0
	
	apply_central_force(input * 1200.0 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	$TwistPivot.rotate_y(twist_input)
	# Esc
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensetivity
			pitch_input = - event.relative.y * mouse_sensetivity
 
