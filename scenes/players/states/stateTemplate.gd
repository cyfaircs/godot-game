# Virual Base Class for all States. Extend to override 'Node' class methods
class_name State extends Node

# Signals when state is finished and 'stateMachine' changed to another state
signal finished(next_state_path: String, data: Dictionary)

# Called by 'stateMachine' when recieving '_unhandeled_input' events
func handle_input(_event: InputEvent) -> void:
	pass

# Called by 'stateMachine' on GoDot's engine loop tick
func update(_delta: float) -> void:
	pass

# Called by 'stateMachine' on GoDot's physics update tick
func physics_update(_delta: float) -> void:
	pass

# Called by 'stateMachine' upon changing the active state. 'data' is a dictionary
# with arbitrary data the state can use to initialize itself
func enter(previous_state_path: String, data := {}) -> void:
	pass
	
# Called by 'stateMachine' before changing the active state. Use this function to
# clean the state
func exit() -> void:
	pass
