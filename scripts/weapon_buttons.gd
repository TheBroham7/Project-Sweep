extends Node2D

signal broom
signal dust_pan
signal swing
signal block

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("swing"):
		_on_Broom_pressed()
	if Input.is_action_just_pressed("defend"):
		_on_DustPan_pressed()

# Attack Weapons

func _on_Broom_pressed():
	
	emit_signal("swing")
	emit_signal("broom")
	$swing_timer.start()
	get_node("Broom").disabled = true

# Defensive Weapons

func _on_DustPan_pressed():
	
	emit_signal("dust_pan")
	emit_signal("block")
	$block_timer.start()
	get_node("DustPan").disabled = true


func _on_swing_timer_timeout():
	get_node("Broom").disabled = false


func _on_block_timer_timeout():
	get_node("DustPan").disabled = false
