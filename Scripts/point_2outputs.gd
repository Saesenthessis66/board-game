extends Node2D

@export var previous_point: NodePath  # The path to the previous point (input)
@export var next_point_top: NodePath  # The path to the next point (output)
@export var next_point_bot: NodePath  # The path to the next point (output)

@onready var button_top: Button = $Button_top
@onready var button_bot: Button = $Button_bot

var go_top = false
var go_bot = false

func _ready():
	# Hide the buttons initially
	hide_buttons()

# Show both buttons
func show_buttons():
	button_top.visible = true
	button_bot.visible = true

# Hide both buttons
func hide_buttons():
	button_top.visible = false
	button_bot.visible = false

func position_arrow_buttons():
	# Get the actual nodes from the NodePaths
	var actual_point_a = get_node(next_point_top) as Node2D
	var actual_point_b = get_node(next_point_bot) as Node2D

	# Get the global positions of each connected point
	var position_a = actual_point_a.global_position
	var position_b = actual_point_b.global_position

	# Calculate directions and position buttons as before
	var direction_to_a = (position_a - global_position).normalized()
	var direction_to_b = (position_b - global_position).normalized()
	var offset_distance = 25.0

	button_top.position = direction_to_a * offset_distance
	#button_top.look_at(position_a)

	button_bot.position = direction_to_b * offset_distance
	#button_bot.look_at(position_b)

func get_previous_point() -> Node2D:
	if previous_point != null:
		return get_node(previous_point) as Node2D
	return null

# Function to return the next point
func get_next_point() -> Node2D:
	position_arrow_buttons()
	show_buttons()
	if go_top == true:
		if next_point_top != null:
			hide_buttons()
			return get_node(next_point_top) as Node2D
		return null
	if go_bot == true:
		if next_point_bot != null:
			hide_buttons()
			return get_node(next_point_bot) as Node2D
		return null
	return null

func _on_button_top_pressed() -> void:
	go_top = true

func _on_button_bot_pressed() -> void:
	go_bot = true
