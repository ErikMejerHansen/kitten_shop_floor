extends Sprite2D


@export var shake_intensity = 10.0
# Called when the node enters the scene tree for the first time.
var noise: FastNoiseLite
func _ready():
	noise = FastNoiseLite.new()
		
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var shake = noise.get_noise_1d(Time.get_ticks_msec()) * shake_intensity
	#offset.x += shake
	#offset.y += shake
	#scale +=  Vector2.ONE * shake/1000
	pass
