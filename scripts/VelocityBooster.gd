extends Area

export (float) var multiplier = 4
const max_magnitude = 12

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body : Node):
	if "linear_velocity" in body:
		var vel = body.linear_velocity
		body.linear_velocity = min(vel.length() * multiplier, max_magnitude) * vel.normalized()
