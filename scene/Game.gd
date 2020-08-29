extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var shipRessource = load("res://assets/Ship.tscn")
var ennemyResource = load("res://assets/Ennemy.tscn")	

# Called when the node enters the scene tree for the first time.
func _ready():
	var ship = shipRessource.instance()
	var ennemy = shipRessource.instance()
	$Ennemies.add_child(ennemy)
	$Ennemies.add_child(ship)
