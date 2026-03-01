extends Node

var banana_count = 0
signal banana_collected

func collect_banana():
	banana_count += 1
	emit_signal("banana_collected", banana_count)
