extends Node2D

var waitTime = 1

var ennemyResource = load("res://assets/Ennemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	pass

func _on_PopEnnemy_timeout():
	var ennemy = ennemyResource.instance()
	$Ennemies.add_child(ennemy)


func _on_WavePopper_timeout():
	$PopEnnemy.wait_time = $PopEnnemy.wait_time/2
