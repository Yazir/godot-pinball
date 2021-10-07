extends Spatial

onready var original_rot = rotation_degrees
const degrees = 8

func _physics_process(delta):
	var vp = get_viewport()
	var m_pos = vp.get_mouse_position()
	var m_pos_norm = m_pos / vp.size
	
	rotation_degrees = original_rot + Vector3((1-m_pos_norm.y-0.5)*degrees, 0, (m_pos_norm.x-0.5)*degrees)
