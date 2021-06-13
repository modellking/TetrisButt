extends Node2D

onready var islands = $"/root/Game/Islands"
onready var player = $"/root/Game/Player"
var activeDynamicIslandsToDistance = {};
const despawnDist = 2500

func randV2D():
	return Vector2(randf()-0.5,randf()-0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ppos = player.getPos();
	# discard far away tiles, that are moving away from us
	for child in activeDynamicIslandsToDistance.keys():
		var sqDist = ppos.distance_squared_to(child.position);
		var last = activeDynamicIslandsToDistance[child]
		activeDynamicIslandsToDistance[child] = sqDist;
		if sqDist < pow(despawnDist, 2):
			activeDynamicIslandsToDistance[child] = 2^63;
		elif last < sqDist:
			activeDynamicIslandsToDistance.erase(child)
			child.queue_free()
	
	# create new tiles up to a limit
	if activeDynamicIslandsToDistance.size() < 8:
		var newborn = islands.getIsland();
		var pos = ppos;
		pos +=  randV2D().normalized() * despawnDist * 0.9
		pos -= pos.posmod(32)
		newborn.position = pos
		add_child(newborn)
		activeDynamicIslandsToDistance[newborn] = 2^63
