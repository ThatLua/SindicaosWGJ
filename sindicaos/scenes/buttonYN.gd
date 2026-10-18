extends Control

var atual_sim
var atual_nao
var bola: Node2D
var papers: Node2D

func _ready() -> void:
	$".".modulate.a = 0.0
	bola = get_tree().current_scene.find_child("8_ball", true, false)
	papers = get_tree().current_scene.find_child("Papers", true, false)
	
	$"Sim Button".modulate.a = 0.0
	$"Não Button".modulate.a = 0.0
	$AnimatedSprite2D/buttonSim.modulate.a = 0.0
	$AnimatedSprite2D/buttonNao.modulate.a = 0.0
	print("Bola encontrada: ", bola)
	print("Papers encontrados:", papers)
	
func _on_sim_button_pressed() -> void:
	if not is_instance_valid(bola) or not is_instance_valid(papers):
		push_error("Bola ou Papers não encontrados!")
		return

	if bola.atual_sim <= 0:
		esgotado($"Sim Button")
		$AnimatedSprite2D.animation = "default"
		return

	if not papers.registrar_decisao(true):
		return

	$AnimatedSprite2D.animation = "press_sim"
	bola.atual_sim -= 1
	bola.texto_atual()

	if bola.atual_nao == 0 and bola.atual_sim == 0:
		end_day()

	await papers.carimbar(true)
	await get_tree().create_timer(0.8).timeout
	$AnimatedSprite2D.animation = "default"
	if bola.atual_sim == 0:
		$AnimatedSprite2D/buttonSim.modulate.a = 0.847
	await get_tree().create_timer(0.15).timeout

	papers.proxima_proposta()

func _on_não_button_pressed() -> void:
	if not is_instance_valid(bola) or not is_instance_valid(papers):
		push_error("Bola ou Papers não encontrados!")
		return

	if bola.atual_nao <= 0:
		esgotado($"Não Button")
		$AnimatedSprite2D.animation = "default"
		return

	if not papers.registrar_decisao(false):
		return

	$AnimatedSprite2D.animation = "press_nao"
	bola.atual_nao -= 1
	bola.texto_atual()

	if bola.atual_nao == 0 and bola.atual_sim == 0:
		end_day()

	await papers.carimbar(false)
	await get_tree().create_timer(0.8).timeout
	$AnimatedSprite2D.animation = "default"
	if bola.atual_nao == 0:
		$AnimatedSprite2D/buttonNao.modulate.a = 0.776
	await get_tree().create_timer(0.15).timeout

	papers.proxima_proposta()
	
func esgotado(botaoIn: Control) -> void: #essa função é totalmente desnecessária pelo visto mas não vou arrumar na reta final da entrega.
	pass

func end_day():
	print("Fim do Ciclo!")
	bola.DiaJogo +=1
	print(bola.DiaJogo)
	#Puxar Relatório
	#relatorio.inicializar()

func botao_visivel():
	var tween_botao = create_tween()
	tween_botao.tween_property(self, "modulate:a", 1.0, 1.0)
