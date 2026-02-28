extends Sprite2D

@onready var area = $Area2D

func _ready():
	area.body_entered.connect(_on_body_entered)
	area.area_entered.connect(_on_area_entered)

func _on_body_entered(_body):
	hide()

func _on_area_entered(_area):
	hide()
