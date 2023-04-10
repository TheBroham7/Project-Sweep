extends Area2D

func _ready():
	hide()
	$CollisionShape2D.disabled = true
	
func _on_Player_dustpan():
	$blockanimation.start()
	show()
	$CollisionShape2D.disabled = false

func _on_blockanimation_timeout():
	hide()
	$CollisionShape2D.disabled = true
