extends Node2D

var speed = 200
# var explosionResource = load("res://assets/Explosion.tscn")

func _ready():
	$Polygon2D.color = Color(rand_range(0.5,1), rand_range(0.5,1), rand_range(0.5,1))
	global_position = Vector2(1920, randi()%950)

func _process(delta):
	move_local_x(-delta*speed)
	if(position[0] < -50):
		get_parent().remove_child(self)

func onHit():
	queue_free()
	# TODO: add stupid explosion.
