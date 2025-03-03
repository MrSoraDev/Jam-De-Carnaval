extends Node2D

@onready var mudar_danca: Timer = $MudarDanca
@onready var path_2d: Path2D = $Caravana/Path2D
@export var max_time: int = 4
@export var min_time: int = 2

@export var player_position_on_queue: int = 4
@export var num_de_dancas: int = 3

var folioes
var danca_atual: int = 1
var nova_danca: int = 1
#primera fase só tem 1 animaçao
func _ready() -> void:
	folioes = path_2d.get_children() #pega os folioes da caravana
	mudar_tempo()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mudar_danca_timeout() -> void:
	mudar_tempo()
	escolhe_danca()
	var position_in_queue = 1
	for foliao in folioes: #pega um foliao do trenzinho
		if foliao.get_child(0).get_child(1) is AnimatedSprite2D: #verifica se naoé a area 2D que o player tem que ficar, ta dando erro pq o patharealimit nao tem 2 filhos
			position_in_queue +=1
			var danca = foliao.get_child(0).get_child(1) #muda a animaçao
			danca.play(AnimationsManager.animations[nova_danca])
			print_debug(AnimationsManager.animations[nova_danca])
		if position_in_queue == player_position_on_queue: #Se estiver na vez do player, espera o dobro de tempo, pra dar tempo do player apertar
			await get_tree().create_timer(3).timeout
		else:
			await get_tree().create_timer(1.5).timeout
	mudar_danca.start()
			
func mudar_tempo() -> void:
	mudar_danca.wait_time = randi_range(min_time,max_time)


func _on_player_limit_body_exited(body: Node2D) -> void:
	print_debug("GameOver")

func escolhe_danca() -> int:
	#precisa verificar se a dança nova é igual a atual
	nova_danca = randi_range(1, num_de_dancas)
	
	print_debug("nova dança %d" % nova_danca)
	print_debug("danca atual %d" % danca_atual)
	
	return nova_danca
