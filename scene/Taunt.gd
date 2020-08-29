tool
extends Control


onready var taunt_list=["New widow", 
	"Nice shot", 
	"Make them cry", 
	"He survived and drawn", 
	"Pain", 
	"No mercy",
	"Abonne-Toi"]

func _ready():
	$Timer.start(1)


func _on_Timer_timeout():
	var taunt = taunt_list[randi() % taunt_list.size()]
	$Taunt.text = taunt
	$Score.visible = false
	$Taunt.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$Taunt.visible = false
	$Score.visible = true

func setScore(score):
	$Score.text = String(score)
