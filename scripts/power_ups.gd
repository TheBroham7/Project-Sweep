extends Node2D

signal first_aid
signal sponge
var spongecount = 3
var firstaidcount = 3

func _ready():
	$FirstAidCount.text = String(spongecount)
	$SpongeCount.text = String(firstaidcount)
	$FirstAidCount.add_color_override("font_color", Color.white)
	$SpongeCount.add_color_override("font_color", Color.white)
	
func _process(delta):
	if Input.is_action_just_pressed("power1"):
		_on_Sponge_pressed()
	if Input.is_action_just_pressed("power2"):
		_on_FirstAid_pressed()
	
func _on_FirstAid_pressed():
	if firstaidcount == 0:
		return
	$PowerUp.play()
	emit_signal("first_aid")
	firstaidcount -= 1
	$FirstAidCount.text = str(firstaidcount)
	if firstaidcount == 0:
		$FirstAid.modulate = Color(255, 0, 0)

func _on_Sponge_pressed():
	if spongecount == 0:
		return
	$PowerUp.play()
	emit_signal("sponge")
	spongecount -= 1
	$SpongeCount.text = str(spongecount)
	if spongecount == 0:
		$Sponge.modulate = Color(255, 0, 0)


func _on_power_ups_sponge():
	get_tree().call_group("rats", "queue_free")
