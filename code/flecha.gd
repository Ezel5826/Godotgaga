extends RigidBody2D

@onready var raycast = $RayCast2D

func _physics_process(delta):
	if raycast.is_colliding():
		if raycast.get_collider().name == "Player":
			raycast.get_collider().get_parent().queue_free()
		
		queue_free()
		
