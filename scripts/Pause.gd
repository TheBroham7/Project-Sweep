extends Control

func _on_Button_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	$current_high_score.text = "High Score: " + str(Global.high_score) + "M"

func _on_button_dupe_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
