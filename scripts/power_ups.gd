extends Node2D

signal first_aid
signal sponge
var spongecount = 3
var firstaidcount = 3

func _ready():
	$FirstAid/FirstAidCount.text = String(spongecount)
	$Sponge/SpongeCount.text = String(firstaidcount)
	
func _on_FirstAid_pressed():
	if firstaidcount == 0:
		$FirstAid.modulate = Color(255, 0, 0)
	else:
		emit_signal("first_aid")
	firstaidcount -= 0

func _on_Sponge_pressed():
	if spongecount == 0:
		$Sponge.modulate = Color(255, 0, 0)
	else:
		emit_signal("sponge")
	spongecount -= 0
