extends RigidBody2D

var rat_health = 3
var speed = rand_range(175.0, 500.0)
var velocity = Vector2(0.0, speed)
var ratpushback = false

func _ready():
	pass

func _process(delta):
	if ratpushback == false: 
		global_position += velocity * delta
	elif ratpushback == true: 
		queue_free()
		$PushBackTimer.start()
		global_position -= velocity*delta
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_PushBackTimer_timeout():
	ratpushback = false
