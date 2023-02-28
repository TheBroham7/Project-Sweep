extends Area2D

signal dead
signal update_health
signal game_over

var player_health = 5
var screen_size
var current_action = 'walk'
export var speed = 200

func _process(_delta):
	pass

func _ready():
	screen_size = get_viewport_rect()
	$Animation.animation = 'walk'
	$Animation.play()
	
func _on_Player_body_entered(body):
	if current_action == 'walk':
		$Damage.play()
		player_health -= 1
		emit_signal("update_health", player_health)
		if player_health <= 0:
			emit_signal("dead")
	elif current_action == "swing":
		$EnemyDied.play()
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
	$GameOver.play()
	emit_signal("game_over")
	hide()
	
func _on_power_ups_first_aid():
	player_health += 1
	emit_signal("update_health", player_health)
	
	

