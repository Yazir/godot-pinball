extends Node

signal score_changed
signal lives_changed
signal game_over
signal game_won
signal switch_off_timeout

onready var switch_count = get_tree().get_nodes_in_group("Switch").size()
var active_switch_count = 0

var score = 0
var lives = 0

var multiplier =  0
var input_enabled = true
var switch_on_timeleft = 0
var final_score = 0
var ignore_game_features = false

func _ready():
	reset()

func reset():
	score = 0
	lives = 3
	multiplier = 1
	active_switch_count = 0
	ignore_game_features = false

func add_score(value : float):
	if ignore_game_features: return
	
	score += value * multiplier
	multiplier += value / 100
	emit_signal("score_changed")

func sub_lives(amount : int):
	if ignore_game_features: return
	
	lives -= amount
	emit_signal("lives_changed")
	if lives <= 0:
		emit_signal("game_over")

func _physics_process(delta):
	if ignore_game_features: return
	
	multiplier *= 0.9995
	multiplier = max(1, multiplier - delta)
	
	if switch_on_timeleft > 0:
		switch_on_timeleft = max(0, switch_on_timeleft - delta)
		if switch_on_timeleft <= 0:
			active_switch_count = 0
			emit_signal("switch_off_timeout")

func handle_switch_activation():
	if ignore_game_features: return
	
	switch_on_timeleft = 5
	active_switch_count += 1
	if active_switch_count == switch_count:
		ignore_game_features = true
		HiscoreManager.push_score(floor(score))
		emit_signal("game_won")
