extends Area2D

var screen_size
export var speed = 400

func _process(_delta):
	var velocity = Vector2.ZERO
	velocity = velocity.normalized() * speed
	$Animation.play()
	$Animation.animation = 'walk'

func _ready():
	screen_size = get_viewport_rect().size
	
	
