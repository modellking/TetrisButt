extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = delta * 1000 * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	input_vector.y = delta * 1000 * (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
