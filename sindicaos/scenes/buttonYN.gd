extends Control

var atual_sim
var atual_nao
var bola: Node2D
var papers: Node2D

func _ready() -> void:
	bola = get_tree().current_scene.find_child("8_ball", true, false)
	papers = get_tree().current_scene.find_child("Papers", true, false)
	
	$"Sim Button".modulate.a = 0.0
	$"Não Button".modulate.a = 0.0
	$AnimatedSprite2D/buttonSim.modulate.a = 0.0
	$AnimatedSprite2D/buttonNao.modulate.a = 0.0
	print("Bola encontrada: ", bola)
	print("Papers encontrados:", papers)
	
func _on_sim_button_pressed() -> void:
	if bola.atual_sim > 0:
		$AnimatedSprite2D.animation = 'press_sim'
		bola.atual_sim -= 1
		bola.texto_atual()
		papers.registrar_decisao(true)
		await get_tree().create_timer(0.15).timeout
		$AnimatedSprite2D.animation = 'default'
		if bola.atual_sim == 0:
			$AnimatedSprite2D/buttonSim.modulate.a = 0.847
			if bola.atual_nao == 0 and bola.atual_sim == 0:
				end_day()
	else: 
		esgotado($"Sim Button")
		$AnimatedSprite2D.animation = 'default'

func _on_não_button_pressed() -> void:
	if bola.atual_nao > 0:
		$AnimatedSprite2D.animation = 'press_nao'
		bola.atual_nao -= 1
		bola.texto_atual()
		papers.registrar_decisao(false)
		await get_tree().create_timer(0.15).timeout
		$AnimatedSprite2D.animation = 'default'
		if bola.atual_nao == 0:
			$AnimatedSprite2D/buttonNao.modulate.a = 0.776
			if bola.atual_nao == 0 and bola.atual_sim == 0:
				end_day()
	else: 
		esgotado($"Não Button")
		$AnimatedSprite2D.animation = 'default'

func esgotado(botaoIn: Control) -> void: #essa função é totalmente desnecessária pelo visto mas não vou arrumar na reta final da entrega.
	pass

func end_day():
	print("Fim do Ciclo!")
	bola.DiaJogo +=1
	print(bola.DiaJogo)
