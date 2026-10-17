extends Area2D

var sorteio
var num_sim
var num_nao
var sorteio_realizado

func _ready() -> void:
	sorteio_realizado = false
	pass
	
func sorteio_diario():
	
	if sorteio_realizado == false: 
		sorteio = [0,1,2,3].pick_random()
		num_nao = 1 + sorteio
		$CanvasLayer/NumNao.text = str(num_nao)
		num_sim = 1 + 4 - num_nao
		$CanvasLayer/NumSim.text = str(num_sim)
		print("Sims: ",num_sim)
		print("Nãos: ",num_nao)
		print("Total de respostas: ", num_sim + num_nao)
	else: pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("clicou!")
			sorteio_diario()
			sorteio_realizado = true
			
