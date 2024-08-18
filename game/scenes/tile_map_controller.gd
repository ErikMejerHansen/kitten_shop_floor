extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
	
func _draw():
	var size = tile_set.tile_size
	var tile_pos = local_to_map(get_local_mouse_position())
	var center_tile = map_to_local(tile_pos)
	
	var snapped = center_tile - Vector2(size.x/2, size.y/2)
	var rect = Rect2(snapped, size)
	
	draw_rect(rect, Color.CHARTREUSE, false, 10)
	
	
	
func _input(event):
	if Input.is_action_just_pressed("build_cellar"):		
		var tile_pos = local_to_map(get_local_mouse_position())
		set_cells_terrain_connect([tile_pos], 0, 0)	
	
