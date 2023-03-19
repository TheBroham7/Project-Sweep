extends RigidBody2D

var velocity = Vector2(0.0, rand_range(50.0, 100.0))
var pushback = false

func _process(delta):
	if pushback == false: 
		global_position -= velocity * delta
	elif pushback == true: 
		$PushBackTimer.start()
		global_position += velocity*delta
	pass


func _on_PushBackTimer_timeout():
	pushback = false
