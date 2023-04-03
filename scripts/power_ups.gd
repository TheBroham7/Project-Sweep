extends Node2D

signal first_aid
signal sponge

func _ready():
	$FirstAidCount.text = String(Global.first_aid)
	$SpongeCount.text = String(Global.sponges)
	$FirstAidCount.add_color_override("font_color", Color.white)
	$SpongeCount.add_color_override("font_color", Color.white)
	
func _process(_delta):
	if Input.is_action_just_pressed("power1"):
		_on_Sponge_pressed()
	if Input.is_action_just_pressed("power2"):
		_on_FirstAid_pressed()
	
func _on_FirstAid_pressed():
	if Global.first_aid == 0:
		return
	emit_signal("first_aid")
	

func _on_Sponge_pressed():
	if Global.sponges == 0:
		return
	emit_signal("sponge")
	$PowerUp.play()
	Global.sponges -= 1
	$SpongeCount.text = str(Global.sponges)
	if Global.sponges == 0:
		$Sponge.modulate = Color(255, 0, 0)


func _on_power_ups_sponge():
	get_tree().call_group("rats", "queue_free")

func _on_Player_update_first_aid_count():
	$PowerUp.play()
	Global.first_aid -= 1
	$FirstAidCount.text = str(Global.first_aid)
	if Global.first_aid == 0:
		$FirstAid.modulate = Color(255, 0, 0)

