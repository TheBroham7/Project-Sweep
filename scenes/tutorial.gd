extends Node2D

var rat = preload("res://scenes/Rat.tscn")
var spawnList = [Vector2(415,-20), Vector2(540, -20), Vector2(665,-20)]
export (float) var spawnTime = rand_range(0.1, 1.0)

func _on_mob_timer_timeout():
	# Spawn rat
	var newRat= rat.instance()
	newRat.position = spawnList[randi() % spawnList.size()]
	add_child(newRat)
	$mob_timer.wait_time = spawnTime
	$mob_timer.start()
