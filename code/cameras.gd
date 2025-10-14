extends Node2D
@onready var cameras = get_node("CanvasLayer/CameraFeed")

const Images = {
	"Cam1" : preload("res://Assets/Captura de pantalla 2025-09-10 151249.png"),
	"Cam2" : preload("res://Assets/Captura de pantalla 2025-09-18 101614.png"),
	"Cam3" : preload("res://Assets/Captura de pantalla 2025-09-17 151437.png")
}

func _ready() -> void:
	for buttn in get_node("CanvasLayer/BttnsContainer").get_children():
		buttn.pressed.connect(button_just_presed.bind(buttn.name))
				
func button_just_presed(img):
	if img in Images and cameras.texture!=Images[img]:
		cameras.texture = Images[img]
		
	
