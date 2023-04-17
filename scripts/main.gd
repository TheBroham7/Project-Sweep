extends Node2D

export (float) var spawnTime = rand_range(0.2, 1.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")
#var weapon_cd = preload("res://scripts/broom.gd")
signal boss_is_spawned
var spawnList = [Vector2(415,-20), Vector2(540, -20), Vector2(665,-20)]
signal continuing

func _ready():
	$MobTimer.start()
	$Game_over.hide()
	$ClassroomBoss.hide()
	$ClassroomBoss/CollisionShape2D.disabled = true



func _on_MobTimer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = spawnList[randi() % spawnList.size()]
	add_child(newRat)
	$MobTimer.wait_time = spawnTime
	$MobTimer.start()

func _process(_delta):
	$HUD.update_score()
	$pause_button/Button/Pause/total_coins.text = "Total Coins: " + str(Global.coins)

func _on_HUD_boss_spawn():
	# Spawn boss
	$MobTimer.stop()
	$SchoolBackground/Music.stop()
	$SchoolBackground/BossMusic.play()
	$ClassroomBoss.position = $BossSpawnPoint.position
	$ClassroomBoss.show()
	emit_signal("boss_is_spawned")

	


func game_over():
	get_tree().call_group("rats", "queue_free")
	$Game_over.show()
	$WaitTime.start()
	set_process(false)
	high_score($HUD.distance)
	$MobTimer.stop()
	$GameOver.play()

func high_score(x):
	if Global.high_score >= x:
		return
	else:
		Global.high_score = x

func _on_WaitTime_timeout():
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_back_to_main_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_clear_timer_timeout():
	$Clear_label.hide()
	$MobTimer.start()
	emit_signal("continuing")
	$HUD.distance_increase = true


func _on_ClassroomBoss_clear():
	$ClassroomBoss.position = $BossSpawnPoint.position
	$SchoolBackground/BossMusic.stop()
	$Clear_label.show()
	$Clear.play()
	$clear_timer.start()
	$SchoolBackground/Music.play()
	

