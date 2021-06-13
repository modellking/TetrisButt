extends Node2D

var velocity = Vector2.ZERO
var islands
var pl_island
var move_step = true
var delta_since_step = 0
var input_vector = Vector2.ZERO
var secPerStep = 0.5;

func _physics_process(delta):
	var cand = Vector2.ZERO;
	cand.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	cand.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	
	if Input.get_action_strength('ui_speed'):
		secPerStep = 0.08
	else:
		secPerStep = 0.5;
	
	if cand != Vector2.ZERO:
		input_vector = cand;
	
	if move_step:
		delta_since_step = 0;
		move_step = false;
		
		velocity = input_vector.normalized()
		
		velocity *= 32
		
		var collide = pl_island.move_and_collide(velocity, true, true, true)
		if collide:
			var other_island = collide.collider
		else:
			pl_island.position += velocity;
	else:
		move_step = delta_since_step > secPerStep
		delta_since_step += delta


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
