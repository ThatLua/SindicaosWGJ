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
	
func _on_sim_button_pressed() -> void:
	if bola.atual_sim > 0:
		bola.atual_sim -= 1
		bola.texto_atual()
	else: esgotado($"Sim Button")

func _on_não_button_pressed() -> void:
	if bola.atual_nao > 0:
		bola.atual_nao -= 1
		bola.texto_atual()
	else: esgotado($"Não Button")

func esgotado(botaoIn: Control) -> void:
	pass
