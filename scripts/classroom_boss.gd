extends Area2D

var projectile_scene =  preload("res://scenes/book_projectile.tscn")

#onready var projectile_spawn = 2
var velocity = Vector2(0.0, rand_range(400.0, 500.0))
var pushback = false
var spawnList = [Vector2(415,200), Vector2(540, 200), Vector2(665,200)]
signal clear
var boss_clears = 0
var forward = true
var boss_spawned = false

func _ready():
	$cbhealth.value = 100
	set_process(false)
	#var boss_health = 3

func _process(delta):
	if forward:
		global_position += velocity * delta
		if global_position.y >= 940:
			forward = false
	if !forward:
		global_position -= velocity * delta
		if global_position.y <= 96:
			forward = true

func _on_ClassroomBoss_area_entered(body):
	$damage.play()
	$cbhealth.value -= rand_range(5, 25)
	if $cbhealth.value <= 0:
		$CollisionShape2D.disabled = true
		boss_spawned = false
		hide()
		boss_clears += 1
		emit_signal("clear")
		$BossProjectileTimer.stop()
	else:
		return
		
	
func _on_BossProjectileTimer_timeout():
	# Spawn boss projectile every 4 seconds 
	spawn_projectile()

func spawn_projectile():
	var projectile = projectile_scene.instance()
	projectile.pushback = true
	projectile.position = spawnList[randi() % spawnList.size()]
	
	get_tree().get_root().get_node("main").add_child(projectile)
	

func _on_WaitTime_timeout():
	if boss_spawned == true:
		$BossProjectileTimer.start()
		spawn_projectile()


func _on_main_boss_is_spawned():
	boss_spawned = true
	$cbhealth.value = 100 + (boss_clears*25)
	set_process(true)
	$WaitTime.start()
	$CollisionShape2D.disabled = false

