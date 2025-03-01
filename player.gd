extends CharacterBody2D

const SPEED = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	
	velocity = get_movement_axis() * SPEED
	move_and_slide()

func get_movement_axis() -> Vector2:
	var axis = Vector2.ZERO

	# Horizontal Movement
	if Input.is_action_pressed("right"):
		axis.x += 1
	if Input.is_action_pressed("left"):
		axis.x -= 1

	# Vertical Movement
	if Input.is_action_pressed("down"):
		axis.y += 1
	if Input.is_action_pressed("up"):
		axis.y -= 1

	# Normalize the vector to prevent diagonal speed boost
	return axis.normalized()

func handle_animations():
	if Input.is_action_just_pressed("action"):
		animated_sprite_2d.play("dance1")
