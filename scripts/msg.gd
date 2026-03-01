extends Node2D

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			get_tree().change_scene_to_file("res://puzzle.tscn")
