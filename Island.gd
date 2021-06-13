extends KinematicBody2D

onready var shapesFactory = get_node("/root/Game/tetrisShapes")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(shapesFactory.getShape())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
