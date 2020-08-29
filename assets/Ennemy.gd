extends Node2D

var speed = 500
# var explosionResource = load("res://assets/Explosion.tscn")

func _ready():
	$Polygon2D.color = Color(rand_range(0.5,1), rand_range(0.5,1), rand_range(0.5,1))
	global_position = Vector2(1920, randi()%950)
	
	var scaleValue = rand_range(1.0,2.0)
	scale = Vector2(scaleValue, scaleValue)

func _process(delta):
	move_local_x(-delta*speed)
	if(position[0] < -50):
		get_parent().remove_child(self)

func _on_Bad_Ship_body_entered(body):
	print("Accident")
	pass # Replace with function body.

func onHit():
	queue_free()
	# TODO: add stupid explosion.
