extends CanvasLayer
	
signal boss_spawn
signal stop_scroll


var distance_increase = true

var distance = 0

func _ready():
	$ColorRect/Distance.add_color_override("font_color", Color.black)
	$ColorRect2/Coins.text = "$" + str(Global.coins)


func update_score():
	if distance_increase:
		distance += 1
	if (distance%2500)==0 and distance_increase == true:
			emit_signal("boss_spawn")
			emit_signal("stop_scroll")
			distance_increase = false
	$ColorRect/Distance.text = str(distance) + "M"


func _on_Player_update_coins():
	var coins_gained = int (rand_range(1, 20))
	Global.add_coin(coins_gained)
	$ColorRect2/Coins.text = "$" + str(Global.coins)

