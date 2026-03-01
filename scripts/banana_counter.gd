extends Label

func _ready():
	text = "Bananas: 0"
	GameManager.banana_collected.connect(_on_banana_collected)
	print("connected:", GameManager.banana_collected.is_connected(_on_banana_collected))

func _on_banana_collected(count):
	text = "Bananas: " + str(count)
	print(count)
