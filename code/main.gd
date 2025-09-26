extends Node2D
var arrowScene = preload("res://Escenas/arrow.tscn")
@onready var char = $Node/Player
@onready var label = $Node2/Label
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

func _on_difficulti_pass():
	if difficulty != 1:
		difficulty -= 1
		timerFall.wait_time = 0.2 * difficulty

func _on_Timer_timeout():
	generar_flecha()

func _process(delta: float) -> void:
	if !is_instance_valid(char) && Input.is_action_just_pressed("R"):
		get_tree().reload_current_scene()

func generar_flecha():
	if !is_instance_valid(char):
		label.text = "Perdiste"
		
		return
	
	var objectSize = char.collition.shape.size.x
	var flecha = arrowScene.instantiate()
	var rand = randi_range(objectSize,get_viewport_rect().size.x-objectSize)
	flecha.position = Vector2(rand,char.collition.shape.size.y-100)
	$Node.add_child(flecha)
