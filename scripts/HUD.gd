extends CanvasLayer
	
signal boss_spawn
signal stop_scroll

var distance_increase = true

var distance = 0

func _ready():
	$HealthBar/ColorRect/HealthLabel.add_color_override("font_color", Color.red)
	$HealthBar/ColorRect/HealthNumber.add_color_override("font_color", Color.red)
	$ColorRect/Distance.add_color_override("font_color", Color.black)


func _on_Player_update_health(health):
	$HealthBar/ColorRect/HealthNumber.text = str(health)

func update_score():
	if distance_increase:
		distance += 1

	if distance == 200 and distance_increase == true:
			emit_signal("boss_spawn")
			emit_signal("stop_scroll")
			distance_increase = false
	$ColorRect/Distance.text = str(distance) + "M"
	
