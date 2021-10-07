extends RigidBody

const duration = 2
const power = 30
const max_offset = 1
var progress = 0


onready var area : Area = get_node("Area")
onready var spring_mesh : Spatial = get_node("Spring")
onready var start_pos = transform.origin

func _physics_process(delta):
	if Input.is_action_pressed("launch") and GameManager.input_enabled:
		progress = min(1, progress + delta / duration)
	else:
		progress = max(0, progress - delta / duration * 35)
	
	if Input.is_action_just_released("launch") and progress > 0.2:
		for body in area.get_overlapping_bodies():
			if body.has_method("apply_impulse"):
				body.apply_impulse(Vector3.ZERO, global_transform.basis.z * 30 * progress)
	
	
	transform.origin = start_pos + transform.basis.z * (1 - progress) * max_offset

func _process(delta):
	spring_mesh.scale.y = lerp(0.5, 0.2, progress)
