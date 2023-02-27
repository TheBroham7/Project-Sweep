extends ParallaxBackground
signal stop

export (float) var scrolling_speed = 150.0

export(PackedScene) var mob_scene

func _ready():
	$Music.play()

func _process(delta):
	scroll_offset.y += scrolling_speed * delta

func _on_Player_body_entered(_body):
	scrolling_speed = 0
	emit_signal("stop")


