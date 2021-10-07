extends Area

export (float) var score_to_add = 100

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(other : Node):
	if "linear_velocity" in other:
		other.linear_velocity = self.global_transform.basis.z * 5
		GameManager.add_score(score_to_add)
