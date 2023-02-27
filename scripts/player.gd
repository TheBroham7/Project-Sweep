extends Area2D

signal strike
signal dead
signal update_health


var player_health = 5
var screen_size
var current_action = 'walk'
export var speed = 200



func _process(_delta):
	$Animation.animation = 'walk'
	$Animation.play()


func _ready():
	screen_size = get_viewport_rect()
	
func _on_Player_body_entered(body):
	if current_action == 'walk':
		player_health -= 1
		emit_signal("update_health", player_health)
		if player_health == 0:
			emit_signal("dead")
	elif current_action == "swing":
		body.queue_free()
	elif current_action == 'block':
		pass

func _on_AnimationTimer_timeout():
	$Animation.play()
	$Animation.animation = 'walk'
	current_action = 'walk'

func _on_weapon_buttons_swing():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "swing"
	current_action = 'swing'
	$Swing.play()
	

func _on_weapon_buttons_block():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "block"
	current_action = 'block'
	$Block.play()

func _on_SchoolBackground_stop():
	pass


func _on_weapon_buttons_broom():
	pass

func _on_Player_dead():
	hide()


func _on_power_ups_first_aid():
	player_health = 5
	emit_signal("update_health", player_health)
