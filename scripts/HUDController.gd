extends Node

export (NodePath) var score_label_p
onready var score_label = get_node(score_label_p)

export (NodePath) var lives_label_p
onready var lives_label = get_node(lives_label_p)

const scale_exponent = 0.3
const score_label_base_scale = 2
var score_scale = 1

func _ready():
	GameManager.connect("score_changed", self, "_on_score_changed")
	GameManager.connect("lives_changed", self, "_on_lives_changed")
	
	_on_score_changed()
	_on_lives_changed()

func _on_score_changed():
	score_label.text = str(floor(GameManager.score))

func _on_lives_changed():
	lives_label.text = "Lives:"
	for i in range(GameManager.lives):
		lives_label.text += " <3"

func _process(delta:float):
	score_scale = lerp(score_scale, GameManager.multiplier, 0.05)
	score_label.rect_scale = Vector2.ONE * (score_label_base_scale + score_scale)
	score_label.rect_pivot_offset.x = score_label.rect_size.x
