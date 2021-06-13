extends KinematicBody2D

onready var shapesFactory = $"/root/Game/tetrisShapes"
var shapeLUT = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	var col = $"./colider";
	var newShape = shapesFactory.getShape()
	col.add_child(newShape)
	var poly = PoolVector2Array();
	# collect polygons
	for shapeInst in col.get_children():
		if !shapeLUT.has(shapeInst):
			shapeLUT[shapeInst] = shapeInst.get_node("./Polygon2D");
		for point in shapeLUT[shapeInst].polygon:
			poly.append(point)
	col.polygon = poly

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
