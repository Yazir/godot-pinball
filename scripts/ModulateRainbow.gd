extends Control

var h = 0

func _process(delta):
	h = fmod(h + delta * 0.25, 1.0)
	self_modulate = Color().from_hsv(h, 1, 1)
