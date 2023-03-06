extends Area2D

signal dead
signal update_health

var player_health = 5
var screen_size
var current_action = 'walk'
export var speed = 200
var boss_is_spawned = false
var mob_health = 1


func _ready():
	screen_size = get_viewport_rect()
	$Animation.animation = 'walk'
	$Animation.play()
	
func _on_Player_body_entered(body):
	if current_action == 'walk':
		$Damage.play()
		player_health -= 1
		$Animation.modulate = Color(255, 0, 0)
		$ColorTimer.start()
		emit_signal("update_health", player_health)
		if player_health <= 0:
			emit_signal("dead")
			hide()
	elif current_action == "swing":
		$EnemyDied.play()
		body.queue_free()
	elif current_action == 'block':
		if boss_is_spawned == true:
			body.queue_free()

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

func _on_weapon_buttons_broom():
	pass

	
func _on_power_ups_first_aid():
	player_health += 1
	emit_signal("update_health", player_health)

func _on_main_boss_is_spawned():
	boss_is_spawned = true


func _on_ColorTimer_timeout():
	$Animation.modulate = Color("ffffff")
