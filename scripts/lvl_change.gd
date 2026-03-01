extends Area2D

var triggered = false

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _on_body_entered(_body):
	if triggered:
		return
	triggered = true
	print("hi")
	await get_tree().create_timer(3.0)
	get_tree().change_scene_to_file("res://scenes/msg.tscn")

func _on_area_entered(_area):
	if triggered:
		return
	triggered = true
	print("hi")
	await get_tree().create_timer(3.0)
	get_tree().change_scene_to_file("res://scenes/msg.tscn")
