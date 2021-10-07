extends Spatial

export (float) var thrust_speed = 100
export (float) var target_rotation
export (NodePath) var body_p
export (String) var input_action_key

onready var body : KinematicBody = get_node(body_p)

var thrusting : bool = false

func _physics_process(delta):
	thrusting = Input.is_action_pressed(input_action_key)
	if thrusting:
		body.rotation_degrees.y = min(target_rotation, body.rotation_degrees.y + thrust_speed * delta)
	else:
		body.rotation_degrees.y = max(0, body.rotation_degrees.y - thrust_speed * delta)
