extends Control

#teste ta tudo dando errado!
var atual_sim
var atual_nao
var bola: Node2D

func _ready() -> void:
	bola = get_tree().current_scene.find_child("8_ball", true, false)
	$"Sim Button".modulate.a = 0.0
	$"Não Button".modulate.a = 0.0
	print("Bola encontrada: ", bola)

	
func _process(delta: float) -> void:
	if bola.atual_sim == 0:
		pass
	if bola.atual_nao == 0:
		pass
	
func _on_sim_button_pressed() -> void:
	if bola.atual_sim > 0:
		$AnimatedSprite2D.animation = 'press_sim'
		bola.atual_sim -= 1
		bola.texto_atual()
		await get_tree().create_timer(0.15).timeout
		$AnimatedSprite2D.animation = 'default'
	else: 
		esgotado($"Sim Button")
		$AnimatedSprite2D.animation = 'default'

func _on_não_button_pressed() -> void:
	if bola.atual_nao > 0:
		$AnimatedSprite2D.animation = 'press_nao'
		bola.atual_nao -= 1
		bola.texto_atual()
		await get_tree().create_timer(0.15).timeout
		$AnimatedSprite2D.animation = 'default'
	else: 
		esgotado($"Não Button")
		$AnimatedSprite2D.animation = 'default'

func esgotado(botaoIn: Control) -> void:
	pass
