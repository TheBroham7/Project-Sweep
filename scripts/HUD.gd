extends CanvasLayer
	


func _on_Player_update_health(health):
	$HealthNumber.text = str(health)

