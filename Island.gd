extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var shapesFactory = get_node("/root/Game/tetrisShapes")
	self.add_child(shapesFactory.getShape())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
