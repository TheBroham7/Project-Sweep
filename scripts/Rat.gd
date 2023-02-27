extends RigidBody2D

var rat_health = 3
var velocity = Vector2(0.0, rand_range(50.0, 400.0))

func _ready():
	pass

func _process(delta):
	global_position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()




