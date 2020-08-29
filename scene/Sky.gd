tool
extends TextureRect

func _ready():
	pass

func _process(delta):
	texture.noise.seed = OS.get_ticks_msec()
