extends Camera2D

@export var zoom_speed = 10.0
@export var zoom_min = 0.4
@export var zoom_max = 2.5

@export var pan_speed = 1000.0
var zoom_target: Vector2

var mouse_drag_start_position = Vector2.ZERO
var camera_drag_start_position = Vector2.ZERO
var is_dragging = false


# Called when the node enters the scene tree for the first time.
func _ready():
	zoom_target = zoom
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_zoom(delta)
	update_position(delta)
	update_drag()


func update_zoom(delta):
	if(Input.is_action_just_pressed("camera_zoom_in")):
		zoom_target *= 1.1
		
	if(Input.is_action_just_pressed("camera_zoom_out")):
		zoom_target *= 0.9
	
	# Clamp zoom
	if(zoom_target.length() > zoom_max or zoom_target.length() < zoom_min):
		zoom_target = zoom
		
	zoom = zoom.slerp(zoom_target, zoom_speed * delta)

func update_position(delta):
	var move_amount = Vector2.ZERO
	
	if(Input.is_action_pressed("camera_pan_left")):
		move_amount.x += -1
	if(Input.is_action_pressed("camera_pan_right")):
		move_amount.x += 1
	if(Input.is_action_pressed("camera_pan_up")):
		move_amount.y += -1
	if(Input.is_action_pressed("camera_pan_down")):
		move_amount.y += 1

	move_amount = move_amount.normalized()
	
	position += move_amount * delta * pan_speed * (1/zoom.x)

func update_drag():
	if Input.is_action_just_pressed("camera_drag"):
		is_dragging = true
		mouse_drag_start_position = get_viewport().get_mouse_position()
		camera_drag_start_position = position
		is_dragging = true
		
	if Input.is_action_just_released("camera_drag"):
		is_dragging = false
		
	if is_dragging:
		var move_vector = get_viewport().get_mouse_position() - mouse_drag_start_position
		position = camera_drag_start_position - move_vector * 1/zoom.x
