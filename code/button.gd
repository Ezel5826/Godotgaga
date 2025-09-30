extends Button
var main = preload("res://Escenas/mundo.tscn")

func _pressed() -> void:
	if pressed:
		print(pressed)
		var world = main.instantiate()
		get_node("Node2").add_child(world)
		queue_free()
