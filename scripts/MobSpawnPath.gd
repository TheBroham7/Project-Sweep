extends Path2D

var timer = 0
export var spawnTime = 4

var follower = preload("res://scenes/Rat.tscn")

func _process(delta):
	timer = timer + delta
	if timer > spawnTime:
		var newFollower = follower.instance()
		newFollower.position 
		add_child(newFollower)
		timer = 0
