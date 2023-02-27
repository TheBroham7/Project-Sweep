extends Area2D

signal strike
signal dead

var player_health = 5
var screen_size
export var speed = 200
var broom = preload("res://scenes/broom.tscn")

func _process(_delta):
	if $Animation.animation == 'walk':
		var velocity = Vector2.ZERO
		velocity = velocity.normalized() * speed
		$Animation.play()


func _ready():
	screen_size = get_viewport_rect()

func _on_HUD_block():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "block"
	$Block.play()
	
	
func _on_HUD_swing():
	$AnimationTimer.start()
	$Animation.play()
	$Animation.animation = "swing"
	$Swing.play()

	
func _on_Player_body_entered(_body):
	if $Animation.animation == 'walk':
		player_health -= 1
	elif $Animation.animation == 'swing':
		emit_signal("strike")
	elif $Animation.animation == 'block':
		emit_signal("block")
		

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

func _on_SchoolBackground_stop():
	$Animation.play()
	$Animation.animation = 'idle'


func _on_weapon_buttons_broom():
	pass
