extends Control

export (String) var input_key
export (float) var hold_time = 0.35
export (NodePath) var spatial_to_follow_p

onready var spatial_to_follow : Spatial = get_node(spatial_to_follow_p)

var held_for = 0
var being_removed = false

func _process(delta):
	if visible and Input.is_action_pressed(input_key) and not being_removed:
		held_for += delta
		if held_for >= hold_time:
			being_removed = true
			queue_free()
	else:
		held_for = 0
	
	if spatial_to_follow:
		rect_position = get_viewport().get_camera().unproject_position(spatial_to_follow.global_transform.origin)
	
	modulate.a = 1 - held_for / hold_time


