extends Node2D

@export var previous_point: NodePath  # The path to the previous point (input)
@export var next_point: NodePath  # The path to the next point (output)

func get_previous_point() -> Node2D:
	if previous_point != null:
		return get_node(previous_point) as Node2D
	return null

# Function to return the next point
func get_next_point() -> Node2D:
	if next_point != null:
		return get_node(next_point) as Node2D
	return null
