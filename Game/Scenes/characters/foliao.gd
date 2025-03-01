extends PathFollow2D

@export var speed: int = 5
#@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	#print(rigid_body_2d.get_colliding_bodies())
