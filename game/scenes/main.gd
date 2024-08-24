extends Node2D
class_name Main

@onready var cellar = $Cellar
@onready var connection_tile_layer = $ConnectionTileLayer

		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ui_tool_selected(tool):
	cellar.expansion_input_enabled = false
	connection_tile_layer.connection_input_enabled = false
	match tool: 
		Game.TOOL.EXTEND_CELLAR:
			cellar.expansion_input_enabled = true
		Game.TOOL.PLACE_CONNECTOR:
			connection_tile_layer.connection_input_enabled = true
			
