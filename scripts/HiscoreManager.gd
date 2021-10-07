extends Node

const path = "user://there_are_no_hiscores_inside"
const pwd = "haha_benis"

#func _input(event):
#	if event is InputEventKey:
#		if event.is_pressed():
#			if event.scancode == KEY_T:
#				push_score(randi()%1000000)
#			if event.scancode == KEY_Y:
#				print(get_scores())

func _ready():
	var file = File.new()
	if not file.file_exists(path):
		file.open_encrypted_with_pass(path, File.WRITE, pwd)
		file.close()

func push_score(score : int):
	var file = File.new()
	file.open_encrypted_with_pass(path, File.READ, pwd)
	var data = file.get_as_text()
	file.close()
	
	file.open_encrypted_with_pass(path, File.WRITE, pwd)
	data += str("\n", str(score))
	file.store_string(data)
	file.close()

func get_scores():
	var file = File.new()
	file.open_encrypted_with_pass(path, File.READ, pwd)
	var scores : Array = []
	while not file.eof_reached():
		var line = file.get_line()
		if line != "":
			scores.push_back(int(line))
	
	file.close()
	scores.sort()
	scores.invert()
	return scores
