extends Area2D

var anim = rand_range(0, 2)

func ready():
	if anim == 0:
		$AnimatedSprite.animation = "bronze"
	elif anim == 1:
		$AnimatedSprite.animation = "silver"
	else:
		$AnimatedSprite.animation = "gold"

func _on_coin_body_entered(_body):
	queue_free()
	
	
