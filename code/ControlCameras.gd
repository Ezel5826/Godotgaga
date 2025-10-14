extends Control
var escene_cameras = preload("res://Escenas/Cameras.tscn")
var pressed = true
@onready var bttn = get_node("Button")
func _ready() -> void:
	bttn.pressed.connect(cameras_load)
	bttn.z_index = -1
	
func cameras_load():

	pressed=!pressed

	if !pressed:
		var cameras = escene_cameras.instantiate()
		var node = Node.new()
		
		self.add_child(node)
		get_child(1).add_child(cameras)
		
		bttn.position -= Vector2(0,100)


	else:
		print(pressed,5)
		bttn.position += Vector2(0,100)
		get_child(1).queue_free()
	
