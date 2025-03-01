extends RigidBody2D

var started_position: Vector2
@onready var timer: Timer = $Timer

func _ready() -> void:
	started_position = global_position
	
	
func _physics_process(delta: float) -> void:
	#if started_position != global_position:
	pass
		
	
		
		


func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	tween = tween.tween_property(self,"global_position",started_position,1)
	print("foi")


func _on_body_entered(body: Node) -> void:
	timer.start()
