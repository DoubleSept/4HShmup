extends KinematicBody2D

var v_speed = 0.0
const MAX_V_SPEED = 200.0
const V_ACCELERATION = 50
var height

var shootResource = load("res://assets/Shoot.tscn")

func onShoot():
	var shoot = shootResource.instance()
	shoot.position = position
	get_node(".").get_parent().add_child(shoot)

# Called when the node enters the scene tree for the first time.
func _ready():
	height = 75
	print("Height ", height)

func _process(delta):
	#INPUT MANAGEMENT
	if(Input.is_action_pressed("ui_down")):
		v_speed = max(0, min(MAX_V_SPEED, v_speed + V_ACCELERATION*delta))
	elif(Input.is_action_pressed("ui_up")):
		v_speed = min(max(-MAX_V_SPEED, v_speed - V_ACCELERATION*delta), 0)
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
				
	if(position[1]<0 && v_speed<0):
		v_speed = 0
	
	if(position[1]>1080 - height && v_speed>0):
		v_speed = 0
	
	var collision = move_and_collide(Vector2(0,v_speed))	
	
	if(Input.is_key_pressed(KEY_SPACE)):
		onShoot()
