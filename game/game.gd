extends Node2D
class_name Game

enum TOOL {PAN_DRAG, PLACE_CONNECTOR, EXTEND_CELLAR}

@export var active_tool = TOOL.PAN_DRAG


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
