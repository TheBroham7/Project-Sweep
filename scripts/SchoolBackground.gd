extends ParallaxBackground

export (float) var scrolling_speed = 200
export(PackedScene) var mob_scene

func _ready():
	$Music.play()

func _process(delta):
	scroll_offset.y += scrolling_speed * delta
