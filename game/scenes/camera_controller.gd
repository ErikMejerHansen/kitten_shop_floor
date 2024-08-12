extends Camera2D

@export var zoom_speed = 10.0
var zoom_target: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	zoom_target = zoom
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_zoom(delta)

func _unhandled_input(event):
	print(event)
	

func update_zoom(delta):
	if(Input.is_action_just_pressed("camera_zoom_in")):
		zoom_target *= 1.1
		
	if(Input.is_action_just_pressed("camera_zoom_out")):
		zoom_target *= 0.9
		
	zoom = zoom.slerp(zoom_target, zoom_speed * delta)
