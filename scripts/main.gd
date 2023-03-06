extends Node2D

export (float) var spawnTime = rand_range(0.1, 2.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")
signal boss_is_spawned

func _ready():
	$MobTimer.start()
	$Game_over.hide()

func _on_MobTimer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = $MobSpawnPoint.position
	add_child(newRat)
	$MobTimer.wait_time = spawnTime
	$MobTimer.start()

func _process(_delta):
	$HUD.update_score()
	

func _on_HUD_boss_spawn():
	# Spawn boss
	$MobTimer.stop()
	$SchoolBackground/Music.stop()
	$SchoolBackground/BossMusic.play()
	get_tree().call_group("rats", "queue_free")
	var boss = classroom_boss.instance()
	boss.position = $BossSpawnPoint.position
	add_child(boss)
	emit_signal("boss_is_spawned")
	

	


func game_over():
	$Game_over.show()
	$WaitTime.start()
	set_process(false)
	$MobTimer.stop()
	$GameOver.play()



func _on_WaitTime_timeout():
	get_tree().change_scene("res://scenes/main_menu.tscn")
