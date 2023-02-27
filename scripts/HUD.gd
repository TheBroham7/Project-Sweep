extends CanvasLayer
	
var distance = 0

func _ready():
	$HealthBar/HealthLabel.add_color_override("font_color", Color.red)
	$HealthBar/HealthNumber.add_color_override("font_color", Color.red)


func _on_Player_update_health(health):
	$HealthBar/HealthNumber.text = str(health)

func update_score():
	distance += 1
	$Distance.add_color_override("font_color", Color.black)
	$Distance.text = str(distance) + "M"

