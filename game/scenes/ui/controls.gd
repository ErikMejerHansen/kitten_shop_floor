extends HBoxContainer
#
#@onready var expand = %Expand
#@onready var connect = %Connect
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#
	#if !expand.gui_input.is_connected(expand_selected):
		#expand.gui_input.connect(expand_selected)
	#if !connect.gui_input.is_connected(connect_selected):
		#expand.gui_input.connect(connect_selected)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	#
#func expand_selected(event: InputEvent) -> void:
	#print("Toggle expand", event)
	#
#func connect_selected(event: InputEvent) -> void:
	#print("Toggle connect", event)
	#
	#
