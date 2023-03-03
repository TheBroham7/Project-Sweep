extends RigidBody2D

var velocity = Vector2(0.0, rand_range(50.0, 100.0))

func _process(delta):
	global_position += velocity * delta
