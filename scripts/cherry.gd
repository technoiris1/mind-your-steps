extends Sprite2D

@onready var area = $Area2D
@onready var timer = Timer.new()

func _ready():
	area.body_entered.connect(_on_body_entered)
	area.area_entered.connect(_on_area_entered)
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	visible = !visible

func _on_body_entered(_body):
	timer.stop()
	hide()

func _on_area_entered(_area):
	timer.stop()
	hide()
	GameManager.banana_count += 1
