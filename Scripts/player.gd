extends CharacterBody2D

@export var current_point: Node2D  # The current point where the player is
@export var move_speed = 75.0  # Movement speed
var target_point: Node2D  # Target point the player will move to
var moving = false  # Is the player currently moving?

# References
@onready var animated_sprite = $AnimatedSprite2D  # Reference to the animated sprite

func _ready():
	# Set the initial point as the starting position
	position = current_point.position

func _process(delta):
	if moving:
		# Move the player towards the target point
		var direction = (target_point.position - position).normalized()
		var movement = direction * move_speed * delta
		if position.distance_to(target_point.position) > movement.length():
			position += movement  # Move the player
		else:
			# Snap to the point and stop moving
			position = target_point.position
			moving = false
			animated_sprite.play("idle")  # Play idle animation when stopping

func move_to_next_point():
	# Get the next point from the current point
	target_point = current_point.get_next_point()
	if target_point:
		moving = true
		current_point = target_point  # Update the current point to the new one
		animated_sprite.play("walk")  # Play walking animation when moving
