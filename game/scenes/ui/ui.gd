extends CanvasLayer

signal tool_selected(tool: Game.TOOL)

@onready var expand_button = %Expand
@onready var connect_button = %Connect

@export var default_tool = Game.TOOL.PAN_DRAG

# Called when the node enters the scene tree for the first time.
func _ready():
	if !expand_button.gui_input.is_connected(expand_selected):
		expand_button.gui_input.connect(expand_selected)
	if !connect_button.gui_input.is_connected(connect_selected):
		connect_button.gui_input.connect(connect_selected)
		
	tool_selected.emit(default_tool)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func expand_selected(_event: InputEvent) -> void:
	tool_selected.emit(Game.TOOL.EXTEND_CELLAR)
	
func connect_selected(_event: InputEvent) -> void:
	tool_selected.emit(Game.TOOL.PLACE_CONNECTOR)
