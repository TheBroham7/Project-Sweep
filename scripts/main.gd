extends Node2D

export (float) var spawnTime = rand_range(5.0, 30.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")

func _ready():
	$MobTimer.start()

func _on_MobTimer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = $MobSpawnPoint.position
	add_child(newRat)

func _on_Player_game_over():
	set_process(false)
	$MobTimer.stop()

func _process(_delta):
	$HUD.update_score()
	

func _on_HUD_boss_spawn():
	# Spawn boss
	$MobTimer.stop()
	var boss = classroom_boss.instance()
	boss.position = $BossSpawnPoint.position
	add_child(boss)


