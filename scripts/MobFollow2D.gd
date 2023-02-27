extends PathFollow2D

export var runSpeed = 175

var rat_state = true

func _process(delta):
	if rat_state == true:
		set_offset(get_offset() + runSpeed * delta)
	elif rat_state == false:
		hide()

func _on_rat_body_entered(body):
	rat_state = false
