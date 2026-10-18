extends Control

#teste ta tudo dando errado!
var atual_sim
var atual_nao
var bola: Node2D

func _ready() -> void:
	bola = get_tree().current_scene.find_child("8_ball", true, false)
	print("Bola encontrada: ", bola)
	
	
func _on_sim_button_pressed() -> void:
	if bola.atual_sim > 0:
		bola.atual_sim -= 1
		bola.texto_atual()
	else: esgotado($"Sim Button")

	pass # Replace with function body.

func _on_não_button_pressed() -> void:
	if bola.atual_nao > 0:
		bola.atual_nao -= 1
		bola.texto_atual()
	else: esgotado($"Não Button")
	
	pass # Replace with function body.

func esgotado(botaoIn: Control) -> void:
	var tween = create_tween()
	tween.tween_property(botaoIn, "rotation", botaoIn.rotation + deg_to_rad(12), 0.1)
	tween.tween_property(botaoIn, "rotation", botaoIn.rotation + deg_to_rad(-12), 0.1)
	tween.tween_property(botaoIn, "rotation", botaoIn.rotation + deg_to_rad(12), 0.1)
	tween.tween_property(botaoIn, "rotation", botaoIn.rotation + deg_to_rad(-12), 0.1)
	tween.tween_property(botaoIn, "rotation", botaoIn.rotation + deg_to_rad(0), 0.1)
