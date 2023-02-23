extends CanvasLayer

signal block
signal swing

func block():
	emit_signal("block")

func swing():
	emit_signal("swing")


