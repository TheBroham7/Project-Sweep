extends Area2D

func _ready():
	hide()
	rotation = 0

func _process(delta):
	rotation_degrees += -10
	
func _on_Player_broom():
	$SwingAnimation.start()
	show()

func _on_SwingAnimation_timeout():
	hide()
