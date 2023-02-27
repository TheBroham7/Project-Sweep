extends Area2D

signal strike
signal dead


var screen_size
export var speed = 200

func _process(_delta):
	if $Animation.animation == 'walk':
		var velocity = Vector2.ZERO
		velocity = velocity.normalized() * speed
		$Animation.play()


func _ready():
	screen_size = get_viewport_rect()

	
func _on_Player_body_entered(body):
	if $Animation.animation == 'walk':
		hide()
		emit_signal('dead')
		$CollisionShape2D.set_deferred("disabled", true)
	elif $Animation.animation == 'swing':
		emit_signal("strike")
		

func _on_AnimationTimer_timeout():
	$Animation.play()
	$Animation.animation = 'walk'

func _on_weapon_buttons_swing():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "swing"

func _on_weapon_buttons_block():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "block"
