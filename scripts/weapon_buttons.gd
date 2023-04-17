extends Node2D

signal swing
signal block

func _ready():
	pass
	
func _process(_delta):
	if Input.is_action_just_pressed("swing"):
		_on_Broom_pressed()
	if Input.is_action_just_pressed("defend"):
		_on_DustPan_pressed()

# Attack Weapons

func _on_Broom_pressed():
	if $Broom.disabled == false:
		emit_signal("swing")
		$swing_timer.start()
		$Broom.disabled = true
		$Broom.modulate = Color(255, 0, 0)

# Defensive Weapons

func _on_DustPan_pressed():
	if $DustPan.disabled == false:
		emit_signal("block")
		$block_timer.start()
		$DustPan.disabled = true
		$DustPan.modulate = Color(255, 0, 0)


func _on_swing_timer_timeout():
	get_node("Broom").disabled = false
	$Broom.modulate = Color("ffffff")


func _on_block_timer_timeout():
	get_node("DustPan").disabled = false
	$DustPan.modulate = Color("ffffff")
