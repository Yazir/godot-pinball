extends Control

onready var hiscore_text : RichTextLabel = get_node("HiscoresLabel")

func _draw():
	var scores = HiscoreManager.get_scores()
	hiscore_text.bbcode_text = ""
	var scores_size = scores.size()
	if scores_size > 0:
		hiscore_text.bbcode_text = "[center]HISCORES\n"
		var max_i = min(15, scores_size)
		for i in range(max_i):
			hiscore_text.bbcode_text += str(scores[i])
			if i < max_i - 1:
				hiscore_text.bbcode_text += ", "
