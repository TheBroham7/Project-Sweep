extends Area2D

var projectile_scene =  preload("res://scenes/book_projectile.tscn")

#onready var projectile_spawn = 2
var velocity = Vector2(0.0, rand_range(400.0, 500.0))
var pushback = false
var spawnList = [Vector2(415,200), Vector2(540, 200), Vector2(665,200)]

var forward = true

func _ready():
	$WaitTime.start()
	$cbhealth.value = 100
	#var boss_health = 3

func _process(delta):
	if forward:
		global_position += velocity * delta
		if global_position.y >= 940:
			forward = false
	else:
		global_position += Vector2(0.0, rand_range(-150.0, -200.0)) * delta
		if global_position.y <= 96:
			forward = true

func _on_ClassroomBoss_area_entered(body):
	$damage.play()
	$cbhealth.value -= rand_range(5, 25)
	if $cbhealth.value <= 0:
		$victory.play()
		Global.stage_clear()
		self.queue_free()
	else:
		return
	#if $cbhealth.value <= 0: 
		
	
func _on_BossProjectileTimer_timeout():
	# Spawn boss projectile every 4 seconds 
	spawn_projectile()

func spawn_projectile():
	var projectile = projectile_scene.instance()
	projectile.pushback = true
	#if projectile_spawn == 1:
		#projectile.position = $Position1.position
		#projectile_spawn = 3
	#elif projectile_spawn == 2:
		#projectile.position = $Position2.position
		#projectile_spawn = 1
	#else: 
		#projectile.position = $Position3.position
		#projectile_spawn = 2
	projectile.position = spawnList[randi() % spawnList.size()]
	
	get_tree().get_root().get_node("main").add_child(projectile)
	#if forward == false:
		#projectile.velocity.y += 750
	

func _on_WaitTime_timeout():
	$BossProjectileTimer.start()
	spawn_projectile()

