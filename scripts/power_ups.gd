extends Node2D

signal first_aid
signal sponge

func _ready():
	pass
	
func _on_FirstAid_pressed():
	emit_signal("first_aid")

func _on_Sponge_pressed():
	emit_signal("sponge")
