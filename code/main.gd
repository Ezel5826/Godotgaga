extends Node2D

var arrowScene = preload("res://Escenas/arrow.tscn")
var camerasScene = preload("res://Escenas/Cameras.tscn")


@onready var character = get_node("character/Player")
@onready var label =  get_node("label/Label")

var difficulty = 5.0
var timerFall
var TimerDiff

func _ready() -> void:
	timerFall = Timer.new()
	timerFall.wait_time = 0.2 * difficulty
	timerFall.one_shot = false
	timerFall.autostart = true
	add_child(timerFall)
	timerFall.connect("timeout", Callable(self, "_on_Timer_timeout"))
	
	TimerDiff = Timer.new()
	TimerDiff.wait_time = 1.0
	TimerDiff.one_shot = false
	TimerDiff.autostart = true
	add_child(TimerDiff)
	TimerDiff.connect("timeout",Callable(self, "_on_difficulti_pass"))


	get_node("Node").add_child(hi) 


func _on_Timer_timeout():
	generar_flecha()

func _on_difficulti_pass():
	if difficulty != 1:
		difficulty -= 1
		timerFall.wait_time = 0.2 * difficulty

func chargeCams():
	var pro = get_node("Node/Node2D")

	if pro == null :
		var gaga= camerasScene.instantiate()
		get_node("Node").add_child(gaga)
	else:
		pro.queue_free()
		

func _process(delta):
	if !is_instance_valid(character) && Input.is_action_just_pressed("R"):
		print(get_tree())
		get_tree().reload_current_scene()
		

func generar_flecha():
	if !is_instance_valid(character):
		label.text = "Perdiste"
		return
	
	var objectSize = character.collition.shape.size.x
	var flecha = arrowScene.instantiate()
	print(objectSize-10,objectSize)
	var rand = randi_range(objectSize/2,get_viewport_rect().size.x-objectSize/2)
	flecha.position = Vector2(rand,character.collition.shape.size.y - 100)
	get_node("character").add_child(flecha)
	
