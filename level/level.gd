extends Node2D


@onready var win_screen : Control = $CanvasLayer/WinScreen
@onready var goal : Area2D = $Goal

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	win_screen.hide()
	goal.body_entered.connect(on_goal_entered)

func on_goal_entered(body):
	print("You win!")
	win_screen.show()
