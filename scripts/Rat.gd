extends RigidBody2D

var rat_health = 3
var velocity = Vector2(0, 200)

func _ready():
	pass

func _process(delta):
	global_position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



