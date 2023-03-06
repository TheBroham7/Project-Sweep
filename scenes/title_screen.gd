extends ColorRect

func _ready():
	$MenuMusic.play()

func _on_clickable_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
