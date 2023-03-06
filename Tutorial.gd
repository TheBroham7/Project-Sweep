extends Control

func _ready():
	$MenuMusic.play()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
