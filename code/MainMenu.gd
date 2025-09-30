extends Node2D
var main = preload("res://Escenas/mundo.tscn")

func _on_button_pressed() -> void:
		var world = main.instantiate()
		print(world.is_node_ready())
		get_node("Node2").add_child(world)
		get_node("Node").queue_free()
		print(get_tree())
