extends Node2D

@onready var blocks = [$block1, $block2, $block3]
@onready var targets = [$pillar1, $pillar2, $pillar3]
@onready var reflections = [$Ref1, $Ref2, $Ref3]

@export var water_y: float = 400.0

func _process(_delta):
	for i in 3:
		reflections[i].global_position = Vector2(
			blocks[i].global_position.x,
			water_y + (water_y - blocks[i].global_position.y)
		)
		
		if reflections[i].global_position.distance_to(targets[i].global_position) < 50:
			reflections[i].modulate = Color(0, 1, 0)
	
	if all_solved():
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://scenes/final.tscn")

func all_solved():
	for i in 3:
		if reflections[i].global_position.distance_to(targets[i].global_position) >= 50:
			return false
	return true
