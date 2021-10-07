extends Control

onready var score_label = get_node("ScoreLabel")

func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")

func _on_visibility_changed():
	if visible:
		score_label.bbcode_text = str("[center]Final score: ", floor(GameManager.score))
