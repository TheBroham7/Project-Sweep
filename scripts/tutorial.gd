extends Node2D

export (float) var spawnTime = rand_range(0.2, 1.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")
signal boss_is_spawned
var spawnList = [Vector2(415,-20), Vector2(540, -20), Vector2(665,-20)]
onready var current_explanation = $StartLabel

func _ready():
	$Explanation1.hide()
	$Explanation2.hide()
	$Explanation3.hide()
	$Explanation4.hide()
	$Explanation5.hide()
	$Game_over.hide()

func _on_MobTimer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = spawnList[randi() % spawnList.size()]
	add_child(newRat)
	$MobTimer.wait_time = spawnTime
	$MobTimer.start()

func _process(_delta):
	$HUD.update_score()
	if Input.is_action_just_pressed("next"):
		explanation()
		
func explanation():
	current_explanation.hide()
	if current_explanation == $Explanation5:
		$MobTimer.start()
		return
	if current_explanation == $StartLabel:
		current_explanation = $Explanation1
	elif current_explanation == $Explanation1:
		current_explanation = $Explanation2
	elif current_explanation == $Explanation2:
		current_explanation = $Explanation3
	elif current_explanation == $Explanation3:
		current_explanation = $Explanation4
	elif current_explanation == $Explanation4:
		current_explanation = $Explanation5
	current_explanation.show()
	

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

