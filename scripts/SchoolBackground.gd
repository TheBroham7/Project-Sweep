extends ParallaxBackground

export (float) var scrolling_speed = 150

export(PackedScene) var mob_scene

func _process(delta):
	scroll_offset.y += scrolling_speed * delta


func _on_Player_body_entered(body):
	scrolling_speed = 0
