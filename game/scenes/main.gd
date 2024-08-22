extends Node2D
class_name Main

@onready var cellar = $Cellar

		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ui_tool_selected(tool):
	if tool == Game.TOOL.EXTEND_CELLAR:
		cellar.expansion_input_enabled = true
	else:
		cellar.expansion_input_enabled = false
