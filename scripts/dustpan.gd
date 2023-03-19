extends Area2D

func _ready():
	hide()
	
func _on_Player_dustpan():
	$blockanimation.start()
	show()

func _on_blockanimation_timeout():
	hide()
