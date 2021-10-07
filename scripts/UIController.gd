extends Control

onready var start_screen = get_node("StartScreen")
onready var victory_screen = get_node("VictoryScreen")
onready var lose_screen = get_node("LoseScreen")
onready var background_modal = get_node("Modal")

var currently_active : Control

func _ready():
	activateScreen(start_screen)
	GameManager.connect("game_over", self, "activateScreen", [lose_screen])
	GameManager.connect("game_won", self, "activateScreen", [victory_screen])
#	OS.window_borderless = true
#	OS.window_maximized = true
#	OS.window_size = OS.get_screen_size()
#	OS.window_position = Ve6ctor2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("launch") and currently_active == start_screen:
		disableScreen(currently_active)

func activateScreen(screen : Control):
	screen.show()
	background_modal.show()
	currently_active = screen
	GameManager.input_enabled = false

func disableScreen(screen : Control):
	screen.hide()
	background_modal.hide()
	GameManager.input_enabled = true

func play():
	disableScreen(start_screen)

func quit():
	get_tree().quit()

func restart():
	GameManager.reset()
	get_tree().reload_current_scene()
