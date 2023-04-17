extends ParallaxBackground

export (float) var scrolling_speed = 150.0
var boss_clears = 0

export(PackedScene) var mob_scene

func _ready():
	$Music.play()

func _process(delta):
	scroll_offset.y += (scrolling_speed + (boss_clears*5)) * delta

func _on_Player_game_over():
	scrolling_speed = 0
	$Music.stop()

func _on_HUD_stop_scroll():
	scrolling_speed = 0

func _on_main_continuing():
	boss_clears += 1
	scrolling_speed = 150.0
