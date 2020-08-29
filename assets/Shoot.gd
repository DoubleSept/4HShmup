extends KinematicBody2D

var direction;
var sprite;
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(rand_range(10, 40), rand_range(-5, 5))
	sprite = get_node("Sprite")
	
func _process(delta):
	rotate(0.6)
	move_and_collide(direction)
	sprite.modulate = Color(rand_range(0, 1), rand_range(0, 1), rand_range(0, 1))
	
	if (position.x > 2000):
		get_parent().remove_child(self)
