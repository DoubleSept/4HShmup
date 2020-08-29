extends KinematicBody2D

var direction;

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(80, rand_range(-20, 20))

func _process(delta):
	rotate(0.6)
	move_and_collide(direction)
	
	if (position.x > 2000):
		get_parent().remove_child(self)
