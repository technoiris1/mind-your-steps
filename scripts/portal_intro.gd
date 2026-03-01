extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _on_body_entered(_body):
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_area_entered(_area):
	get_tree().change_scene_to_file("res://scenes/main.tscn")
