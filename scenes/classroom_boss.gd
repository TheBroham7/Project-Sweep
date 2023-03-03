extends Area2D

var projectile_scene =  preload("res://scenes/book_projectile.tscn")

onready var projectile_spawn = 2
var velocity = Vector2(0.0, rand_range(50.0, 100.0))

var forward = true

func _ready():
	$WaitTime.start()

func _process(delta):
	if forward:
		global_position += velocity * delta
		if global_position.y >= 410:
			forward = false
	else:
		global_position += Vector2(0.0, rand_range(-50.0, -100.0)) * delta
		if global_position.y <= 96:
			forward = true
	
func _on_BossProjectileTimer_timeout():
	# Spawn boss projectile every 4 seconds 
	spawn_projectile()

func spawn_projectile():
	var projectile = projectile_scene.instance()
	if projectile_spawn == 1:
		projectile.position = $Position1.position
		projectile_spawn = 2
	else:
		projectile.position = $Position2.position
		projectile_spawn = 1
	add_child(projectile)

func _on_WaitTime_timeout():
	$BossProjectileTimer.start()
	spawn_projectile()
