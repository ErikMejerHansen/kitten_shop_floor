extends CanvasLayer
const SHOVEL = preload("res://sprites/sheets/shovel@0.13x.png")

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

func expand_selected(event: InputEvent) -> void:
	if event is not InputEventMouseButton:
		return
	
	if (event as InputEventMouseButton).button_index == 1:
		Input.set_custom_mouse_cursor(SHOVEL)
		tool_selected.emit(Game.TOOL.EXTEND_CELLAR)
	
func connect_selected(event: InputEvent) -> void:
	if event is not InputEventMouseButton:
		return
		
	if (event as InputEventMouseButton).button_index == 1:
		Input.set_custom_mouse_cursor(null)
		tool_selected.emit(Game.TOOL.PLACE_CONNECTOR)
