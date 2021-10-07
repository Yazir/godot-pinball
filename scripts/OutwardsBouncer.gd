extends Area

export (float) var score_to_add = 100
const power = 3

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(other : Node):
	if "linear_velocity" in other:
		var direction = (other.global_transform.origin - global_transform.origin).normalized()
		other.linear_velocity = direction * power
		GameManager.add_score(score_to_add)
