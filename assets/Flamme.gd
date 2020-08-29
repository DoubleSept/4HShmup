extends Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	texture_offset = Vector2(rand_range(0,1), 0)
