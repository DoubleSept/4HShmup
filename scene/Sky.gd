tool
extends Node2D

func _ready():
	$Timer.start(0.1)

func _on_Timer_timeout():
	$Texture.texture.noise.seed = OS.get_ticks_msec()
