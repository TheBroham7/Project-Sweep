extends Control

func _on_powerup1_pressed():
	if Global.coins >= 35:
		$purchase_made.play()
		Global.spend_coin(35)
		Global.add_sponge()
		update_coin_label()
		update_sponge_label()
	else:
		return
	
func _ready():
	$menu_music.play()
	update_coin_label()
	update_sponge_label()
	update_first_aid_label()
	

func _on_powerup2_pressed():
	if Global.coins >= 45:
		$purchase_made.play()
		Global.spend_coin(45)
		Global.add_first_aid()
		update_coin_label()
		update_first_aid_label()
	else:
		return

func _on_back_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")

func update_coin_label():
	$wallet.text = "$" + str(Global.coins)

func update_sponge_label():
	$sponge_amounts.text = "Currently: " + str(Global.sponges)
	
func update_first_aid_label():
	$first_aid_amounts.text = "Currently: " + str(Global.first_aid)
