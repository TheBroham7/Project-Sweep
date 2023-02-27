extends CanvasLayer
	
func _ready():
	$HealthBar/HealthLabel.add_color_override("font_color", Color.red)
	$HealthBar/HealthNumber.add_color_override("font_color", Color.red)


func _on_Player_update_health(health):
	$HealthBar/HealthNumber.text = str(health)

