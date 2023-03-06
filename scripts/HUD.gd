extends CanvasLayer
	
signal boss_spawn
signal stop_scroll

var score_increase = true

var distance = 0

func _ready():
	$HealthBar/HealthLabel.add_color_override("font_color", Color.red)
	$HealthBar/HealthNumber.add_color_override("font_color", Color.red)


func _on_Player_update_health(health):
	$HealthBar/HealthNumber.text = str(health)

func update_score():
	if score_increase:
		distance += 1
		if distance == 200:
			emit_signal("boss_spawn")
			emit_signal("stop_scroll")
			score_increase = false
	$Distance.add_color_override("font_color", Color.black)
	$Distance.text = str(distance) + "M"
	
