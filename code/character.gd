extends CharacterBody2D
@onready var collition = $CollisionShape2D 

const speed:float = 500.0
const jump_velocity:float = -500.0


var gravity = 980

func _physics_process(delta) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("ui_accept") && is_on_floor():
		velocity.y = jump_velocity
		
	var dir = Input.get_axis("ui_left","ui_right")
	if dir:
		velocity.x = dir * speed
	else:
		velocity.x = move_toward(velocity.x,0,speed)
	#var collide = move_and_collide(velocity*delta)
	#print(collide)
	#if collide:
	#	var collider = collide.get_collider()
	#	print(collider.name)
	#	if collider.name == "RigidBody2D":
	#		queue_free()
	
	move_and_slide()
