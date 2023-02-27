extends Node2D

export (float) var spawnTime = rand_range(5.0, 30.0)
var rat = preload("res://scenes/Rat.tscn")

func _ready():
	$MobTimer.start()

func _on_MobTimer_timeout():
	var newRat= rat.instance()
	newRat.position = $MobSpawnPoint.position
	add_child(newRat)

func _on_Player_game_over():
	set_process(false)
	$MobTimer.stop()

func _process(_delta):
	$HUD.update_score()
