extends Node2D

var velocity = Vector2.ZERO
var islands
var pl_island

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	pl_island.move_and_collide(velocity * delta * 1000)


# Called when the node enters the scene tree for the first time.
func _ready():
	islands = $"/root/Game/Islands"
	pl_island = islands.getIsland()
	add_child(pl_island)
	var cam = $"./cam"
	remove_child(cam)
	pl_island.add_child(cam)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func getPos():
	return pl_island.position
