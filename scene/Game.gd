extends Node2D

var ennemyResource = load("res://assets/Ennemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	pass

func _on_PopEnnemy_timeout():
	var ennemy = ennemyResource.instance()
	$Ennemies.add_child(ennemy)
