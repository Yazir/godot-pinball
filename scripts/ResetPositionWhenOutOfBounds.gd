extends Timer

export (NodePath) var pinball_spawn_p
onready var pinball_spawn = get_node(pinball_spawn_p)

onready var parent = get_parent()

func _ready():
	self.connect("timeout", self, "_on_timeout")
	parent.global_transform.origin = pinball_spawn.global_transform.origin

func _on_timeout():
	if parent.global_transform.origin.y <= -5:
		parent.global_transform.origin = pinball_spawn.global_transform.origin
		parent.linear_velocity = Vector3.ZERO
		GameManager.sub_lives(1)
