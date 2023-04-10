extends Node2D

export (float) var spawnTime = rand_range(0.2, 1.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")
signal boss_is_spawned
var spawnList = [Vector2(415,-20), Vector2(540, -20), Vector2(665,-20)]
signal continuing

func _ready():
	Global.connect("stage_clear", self, "on_stage_clear")
	$MobTimer.start()
	$Game_over.hide()

func on_stage_clear():
	$Clear_label.show()
	$clear_timer.start()

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
	var boss = classroom_boss.instance()
	boss.position = $BossSpawnPoint.position
	add_child(boss)
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
	$SchoolBackground/BossMusic.stop()
	$SchoolBackground/Music.play()
	$Clear_label.hide()
	$SchoolBackground.boss_clears += 1
	$MobTimer.start()
	emit_signal("continuing")
	$HUD.distance_increase = true
