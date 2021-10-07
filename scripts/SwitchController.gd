extends Area

export (float) var score_to_add = 50

onready var switch_light = get_node("SwitchLight")
var switched_on = false

func _ready():
	connect("body_entered", self, "_on_body_entered")
	GameManager.connect("switch_off_timeout", self, "_on_switch_off_timeout")

func _on_body_entered(other : Node):
	if "linear_velocity" in other and not switched_on:
		GameManager.add_score(score_to_add)
		GameManager.handle_switch_activation()
		switched_on = true
		switch_light.show()

func _on_switch_off_timeout():
		switch_light.hide()
		switched_on = false
