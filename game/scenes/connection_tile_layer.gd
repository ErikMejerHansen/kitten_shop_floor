extends TileMapLayer

const top_left = Vector2i(0,0)
const horizontal = Vector2i(1,0)
const top_right = Vector2i(2,0)
const vertical = Vector2i(2,1)
const bottom_right = Vector2i(2,2)
const bottom_left = Vector2i(0,2)

@export var connection_input_enabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func _unhandled_input(_event):
	if Input.is_action_just_pressed("build_cellar") and connection_input_enabled:			
		var tile_pos = local_to_map(get_local_mouse_position())
		place_tile(tile_pos, true)		

func place_tile(tile_pos: Vector2i, recurse) -> void:
	
	var has_left_neighbour = has_placed_tile_at(tile_pos + Vector2i.LEFT)
	var has_right_neighbour = has_placed_tile_at(tile_pos + Vector2i.RIGHT)
	var has_top_neighbour = has_placed_tile_at(tile_pos + Vector2i.UP)
	var has_bottom_neighbour = has_placed_tile_at(tile_pos + Vector2i.DOWN)
	
	if has_left_neighbour and has_right_neighbour:
		set_connector(tile_pos,horizontal)	
	elif has_top_neighbour and has_bottom_neighbour:
		set_connector(tile_pos, vertical)		
	elif has_top_neighbour and has_right_neighbour:
		set_connector(tile_pos, bottom_left)
	elif has_top_neighbour and has_left_neighbour:
		set_connector(tile_pos, bottom_right)
	elif has_bottom_neighbour and has_right_neighbour:
		set_connector(tile_pos, top_left)
	elif has_bottom_neighbour and has_left_neighbour:
		set_connector(tile_pos, top_right)
	elif (has_top_neighbour or has_bottom_neighbour) and not (has_left_neighbour or has_right_neighbour):
		set_connector(tile_pos, vertical)	
	elif (has_left_neighbour or has_right_neighbour) and not (has_top_neighbour or has_bottom_neighbour):	
			set_connector(tile_pos, horizontal)	
	elif not (has_top_neighbour
		or has_bottom_neighbour
		or has_right_neighbour
		or has_left_neighbour):
		set_connector(tile_pos, vertical)	
	
	# Then fix affected neighbours
	if recurse:
		if has_top_neighbour:
			place_tile(tile_pos + Vector2i.UP, false)
		if has_right_neighbour:
			place_tile(tile_pos + Vector2i.RIGHT, false)
		if has_bottom_neighbour:
			place_tile(tile_pos + Vector2i.DOWN, false)
		if has_left_neighbour:
			place_tile(tile_pos + Vector2i.LEFT, false)
			
func set_connector(placement_position, atlas_coord) -> void:
	# Second argument is the ID from the TileSet and can be seen in the TileSet menu
	set_cell(placement_position, 3, atlas_coord)		
		


func has_placed_tile_at(location: Vector2i) -> bool:
		return get_cell_atlas_coords(location) != Vector2i(-1, -1)
