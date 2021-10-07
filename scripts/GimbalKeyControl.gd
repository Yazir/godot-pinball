extends Spatial

onready var original_rot = rotation
const degrees = deg2rad(8)

func _physics_process(delta):
	var input = Vector2()
	if Input.is_action_pressed("tilt_up"): input.y -= 1
	if Input.is_action_pressed("tilt_down"): input.y += 1
	if Input.is_action_pressed("tilt_left"): input.x -= 1
	if Input.is_action_pressed("tilt_right"): input.x += 1
	
	var target_rot = Quat(original_rot)
	if input.x != 0 or input.y != 0:
		target_rot = Quat(original_rot + Vector3(-(input.y/2)*degrees, 0, (input.x/2)*degrees))
	var interp_rot = Quat(rotation).slerp(target_rot, 0.16)
	rotation = interp_rot.get_euler()
