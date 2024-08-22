extends Node
class_name StateMachine

var current_state: State
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_child_transistion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state._process(delta)
	
func on_child_transistion(state, new_state_name):
	if state == current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
		
