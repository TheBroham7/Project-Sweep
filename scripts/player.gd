extends Area2D

func _process(_delta):
	$Animation.play()

func start(_pos):
	show()
	$Collision.disabled = false
