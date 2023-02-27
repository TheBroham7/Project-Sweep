extends Node2D

signal broom
signal dust_pan
signal swing
signal block

func _ready():
	pass

# Attack Weapons

func _on_Broom_pressed():
	emit_signal("swing")
	emit_signal("broom")

# Defensive Weapons

func _on_DustPan_pressed():
	emit_signal("dust_pan")
	emit_signal("block")
