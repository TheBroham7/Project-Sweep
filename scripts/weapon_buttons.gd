extends Node2D

signal broom
signal dust_pan
signal swing
signal block

func _ready():
	pass

# Attack Weapons

func _on_Broom_pressed():
	$swing_timer.start()
	get_node("Broom").disabled = true
	emit_signal("swing")
	emit_signal("broom")

# Defensive Weapons

func _on_DustPan_pressed():
	$block_timer.start()
	get_node("DustPan").disabled = true
	emit_signal("dust_pan")
	emit_signal("block")


func _on_swing_timer_timeout():
	get_node("Broom").disabled = false


func _on_block_timer_timeout():
	get_node("DustPan").disabled = false
