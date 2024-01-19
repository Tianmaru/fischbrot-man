class_name Fish
extends RigidBody2D

const fish_power = 500

var bubbles_scene = preload("res://fish/bubbles.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_bubbles()

func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	spawn_bubbles()

func spawn_bubbles():
	var bubbles = bubbles_scene.instantiate()
	add_child(bubbles)
	bubbles.restart()
