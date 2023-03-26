extends CanvasLayer
	
signal boss_spawn
signal stop_scroll

var distance_increase = true

var coins = 0
var distance = 0

func _ready():
	$ColorRect/Distance.add_color_override("font_color", Color.black)



func update_score():
	if distance_increase:
		distance += 1
	if distance == 3500 and distance_increase == true:
			emit_signal("boss_spawn")
			emit_signal("stop_scroll")
			distance_increase = false
	$ColorRect/Distance.text = str(distance) + "M"

func update_coins():
	coins += 1
	$ColorRect2/Coins.text = "$" + str(coins) 
	
	
