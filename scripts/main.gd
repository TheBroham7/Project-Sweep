extends Node2D

var timer = 0
export var spawnTime = 4

var rat = preload("res://scenes/Rat.tscn")

func _ready():
	$MobTimer.start()

func _on_MobTimer_timeout():
	var newRat= rat.instance()
	newRat.position = $MobSpawnPoint.position
	add_child(newRat)
