extends Area2D

var selected = false
var offset = Vector2.ZERO

func _input_event(_viewport, event, _shape):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			selected = true
			offset = global_position - get_global_mouse_position()

func _process(_delta):
	if selected:
		global_position = get_global_mouse_position() + offset
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			selected = false
