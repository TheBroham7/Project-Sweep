extends Area2D

signal dead
#signal update_coins_1
#signal update_coins_5
#signal update_coins_10
signal update_coins
signal broom
signal dustpan
signal update_first_aid_count

var screen_size
var current_action = 'walk'
export var speed = 200
var boss_is_spawned = false
var mob_health = 1
var rat_push_back = rand_range(100.0, 500.0)
var coin = preload("res://scenes/coin.tscn")


func _ready():
	screen_size = get_viewport_rect()
	$Animation.animation = 'walk'
	$Animation.play()
	
func _process(_delta):
	if Input.is_action_just_pressed("left"):
		if position.x > 420:
			position.x -= 125
	if Input.is_action_just_pressed("right"):
		if position.x < 650:
			position.x += 125
	
func _on_Player_body_entered(body):
	if current_action == 'walk':
		body.queue_free()
		#body.pushback = true
		#$ratPushBackTimer.start()
		#body.velocity -= Vector2(0.0, rat_push_back) 
		#$_on_ratPushBackTimer_timeout(body)
		#body.global_position *= -0.001
		$HealthBar.value -= rand_range(10, 20)
		$Animation.modulate = Color(255, 0, 0)
		$ColorTimer.start()
		$Damage.play()
		if $HealthBar.value <= 0:
			emit_signal("dead")
			hide()
	elif current_action == "swing":
		#body.velocity = Vector2(0.0, 0.0)
		$EnemyDied.play()
		var rat_position = body.position
		body.queue_free()
		#var newCoin = coin.instance()
		#newCoin.position = rat_position
		#newCoin.position.y -= 5
		#body.call_deferred(newCoin)
		#if newCoin.animation == "bronze":
		#	emit_signal("update_coins_1")
		#elif newCoin.animation == "silver":
		#	emit_signal("update_coins_5")
		#else:
		#	emit_signal("update_coins_10")
		emit_signal("update_coins")
	elif current_action == 'block':
		body.pushback = true
		if boss_is_spawned == true:
			body.queue_free()

func _on_AnimationTimer_timeout():
	$Animation.play()
	$Animation.animation = 'walk'
	current_action = 'walk'

func _on_weapon_buttons_swing():
	emit_signal("broom")
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "swing"
	current_action = 'swing'
	$Swing.play()
	

func _on_weapon_buttons_block():
	emit_signal("dustpan")
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "block"
	current_action = 'block'
	$Block.play()
	
func _on_power_ups_first_aid():
	if $HealthBar.value == 100:
		return
	elif $HealthBar.value < 100:
		emit_signal("update_first_aid_count")
		if ($HealthBar.value + 20) > 20:
			$HealthBar.value = 100
		else:
			$HealthBar.value += 20
	

func _on_main_boss_is_spawned():
	boss_is_spawned = true


func _on_ColorTimer_timeout():
	$Animation.modulate = Color("ffffff")


#func _on_ratPushBackTimer_timeout(body):
	#body.velocity = Vector2(0.0, rand_range(175.0, 500.0))
  
