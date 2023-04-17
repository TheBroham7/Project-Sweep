extends Area2D
#var weapon_cd = preload("res://scenes/main.tscn")

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
	#$Animation.modulate = Color(255, 0, 0)

func _on_SwingAnimation_timeout():
	hide()
	$CollisionShape2D.disabled = true


func _on_broom_body_entered(body):
	if body.get_name() == "newRat":
		body.queue_free()
