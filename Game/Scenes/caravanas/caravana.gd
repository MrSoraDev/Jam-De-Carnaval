extends Node2D

@export var speed: int = 5
@onready var path_2d: Path2D = $Path2D
var folioes



func _ready() -> void:
	folioes = path_2d.get_children()#pega os folioes



func _process(delta: float) -> void:
	for foliao in folioes:
		foliao.progress += speed * delta #faz eles andarem
