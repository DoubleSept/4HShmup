extends Node2D

var waitTime = 1
var nbPerPop = 1
var score = 0

var ennemyResource = load("res://assets/Ennemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	pass

func _on_PopEnnemy_timeout():
	for i in range(nbPerPop):
		var ennemy = ennemyResource.instance()
		ennemy.connect("ennemyDied", self, "_on_ennemy_died")
		$Ennemies.add_child(ennemy)

func _on_WavePopper_timeout():
	if($PopEnnemy.wait_time > 0.1):
		$PopEnnemy.wait_time = $PopEnnemy.wait_time/2
	else:
		nbPerPop = nbPerPop + 1
		
func _on_ennemy_died():
	score = score + 1
	$Taunt.setScore(score)
