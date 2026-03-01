extends Area2D

var triggered = false

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _on_body_entered(_body):
	if triggered:
		return
	triggered = true
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.timeout.connect(_change_scene)
	timer.start()

func _on_area_entered(_area):
	if triggered:
		return
	triggered = true
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.timeout.connect(_change_scene)
	timer.start()

func _change_scene():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/msg.tscn")
