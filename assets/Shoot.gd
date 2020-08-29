extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CollisionShape2D").connect("body_enter", self, "onCollision")

func _process(delta):
	move_and_collide(Vector2(100, 0))

func onCollision(body):
	if (body.get_name() != "Bad Ship"):
		return
	
	body.onHit()
