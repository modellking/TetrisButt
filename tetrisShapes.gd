extends Node2D

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

var shapepath = 'res://TetrisShapes/';
onready var shapesNames = list_files_in_directory(shapepath);
var shapes = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0;
	for kind in shapesNames:
		var purekind = kind.split('.')[0]
		shapes[purekind] = load(shapepath + kind)
		shapesNames[i] = purekind
		i += 1

func getShape(kind = ""):
	var child;
	
	if (!kind or kind == ""):
		child = shapes[shapesNames[randi() % shapesNames.size()]]
	else:
		child = shapes[kind]
	return child.instance();
