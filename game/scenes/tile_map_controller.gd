extends TileMapLayer

@export var expansion_input_enabled = false
@export var highligt_color: Color = Color.ALICE_BLUE
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()
	pass
	
func _draw():
	if(not expansion_input_enabled):
		return
		
	var size = tile_set.tile_size
	var tile_pos = local_to_map(get_local_mouse_position())
	var center_tile = map_to_local(tile_pos)
	
	var snapped_position = center_tile - Vector2(size.x/2, size.y/2)
	var rect = Rect2(snapped_position, size)
	
	draw_rect(rect, highligt_color, true)
		
func _unhandled_input(_event):
	if Input.is_action_just_pressed("build_cellar") and expansion_input_enabled:		
		var tile_pos = local_to_map(get_local_mouse_position())
		set_cells_terrain_connect([tile_pos], 0, 0)	
	
