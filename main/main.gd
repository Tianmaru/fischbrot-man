extends Control

# define variables with var
# GDScript supports static typing with the walrus operator :=
var n_clicked := 0

# the onready annotation let's those next 2 lines be run at _ready time
# use onready when you grab Nodes to make sure they exist
@onready var audio_player : AudioStreamPlayer = get_node("AudioStreamPlayer")

# $NodePath is shorthand for get_node(NodePath)
@onready var start_button : Button = $VBoxContainer/StartButton
@onready var exit_button : Button = $VBoxContainer/ExitButton

# preload the level scene
var level_scene := preload("res://level/level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.button_down.connect(on_start_button_down)
	exit_button.button_down.connect(on_exit_button_down)

# load the level
func on_start_button_down():
	get_tree().change_scene_to_packed(level_scene)

# quit the game
func on_exit_button_down():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_down():
	print("Hello World!")
	audio_player.play()
	n_clicked += 1
	print("You clicked the Button %s times" % n_clicked)
	if n_clicked >= 100:
		print("...you know this is not a cookie clicker, right?")

