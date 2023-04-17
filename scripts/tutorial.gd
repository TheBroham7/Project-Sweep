extends Node2D

export (float) var spawnTime = rand_range(0.2, 1.0)
var rat = preload("res://scenes/Rat.tscn")
var classroom_boss = preload("res://scenes/classroom_boss.tscn")
signal boss_is_spawned
var spawnList = [Vector2(415,-20), Vector2(540, -20), Vector2(665,-20)]
onready var current_explanation = $Explanation1
signal next
var action = "swing"
var score = 0
onready var count = false

func _ready():
	$Player/Collision.disabled = false
	$SchoolBackground._on_HUD_stop_scroll()
	$Explanation2.hide()
	$Explanation3.hide()
	$Explanation4.hide()
	$Explanation5.hide()
	$good_luck.hide()

func _on_MobTimer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = spawnList[randi() % spawnList.size()]
	add_child(newRat)
	$MobTimer.wait_time = spawnTime
	$MobTimer.start()

func _process(_delta):
	if Input.is_action_just_pressed(action):
			explanation()
	if count == true:
		score += 1
		if score == 850:
			$good_luck.show()
		if score > 1000:
			get_tree().change_scene("res://scenes/main_menu.tscn")
		
		
func explanation():
	current_explanation.hide()
	if current_explanation == $Explanation5:
		
		return
	elif current_explanation == $Explanation1:
		current_explanation = $Explanation2
		action = "defend"
	elif current_explanation == $Explanation2:
		current_explanation = $Explanation3
		action = "power1"
		$SchoolBackground._on_main_continuing()
		$MobTimer.start()
		count = true
	elif current_explanation == $Explanation3:
		current_explanation = $Explanation4
		action = "power2"
	elif current_explanation == $Explanation4:
		current_explanation = $Explanation5
		action = "left"
	current_explanation.show()

func game_over():
	$Player/Collision.disabled = true
	$WaitTime.start()
	set_process(false)
	$MobTimer.stop()
	$GameOver.play()



func _on_WaitTime_timeout():
	get_tree().change_scene("res://scenes/main_menu.tscn")


