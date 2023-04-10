extends Area2D

func _ready():
	hide()
	$CollisionShape2D.disabled = true
	rotation = 0

func _process(_delta):
	rotation_degrees += -10
	
func _on_Player_broom():
	$SwingAnimation.start()
	show()
	$CollisionShape2D.disabled = false

func _on_SwingAnimation_timeout():
	hide()
	$CollisionShape2D.disabled = true


func _on_broom_body_entered(body):
	if body.get_name() == "newRat":
		body.queue_free()
