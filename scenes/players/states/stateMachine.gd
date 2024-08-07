class_name stateMachine extends Node

# The initial state of the machine
@export var intitial_state : State = null

# The current state of the machine
@onready var state: State = (
	func get_initial_state() -> State: \
		return intitial_state \
	if intitial_state != null \
		else get_child(0) 
	).call()

func _ready() -> void:
	# Every state gets a reference to the state machine
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(_transition_to_next_state)
	
	# Waits for the root node to of the scene the machine is part of (owner), 
	# which guarantees that all the available data and nodes are available
	await owner.ready
	state.enter("")
	
func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state: " + target_state_path + " but it doesn't exist.")
		return
		
	var previous_state_path := state.name
	state.exit()
	state
