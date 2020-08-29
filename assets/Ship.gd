extends Node2D

var v_speed = 0.0
const MAX_V_SPEED = 200.0
const V_ACCELERATION = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#INPUT MANAGEMENT
	if(Input.is_action_pressed("ui_down")):
		v_speed = min(MAX_V_SPEED, v_speed + V_ACCELERATION*delta)
	elif(Input.is_action_pressed("ui_up")):
		v_speed = max(-MAX_V_SPEED, v_speed - V_ACCELERATION*delta)
	else:
		#Slowing down
		if(v_speed > 0):
			v_speed = v_speed - V_ACCELERATION*0.5*delta
			if(v_speed < 0):
				v_speed = 0
		elif(v_speed < 0):
			v_speed = v_speed + V_ACCELERATION*0.5*delta
			if(v_speed > 0):
				v_speed = 0
	
	move_local_y(v_speed)
	
	if(position[1]<0 && v_speed<0):
		position = Vector2(position[0], 0)
		v_speed = 0
	
	if(position[1]>1080 - $Collision.get_shape().get_extents() && v_speed>0):
		position = Vector2(position[0], 1080)
		v_speed = 0
