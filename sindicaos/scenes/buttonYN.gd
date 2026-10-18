extends Control

#teste ta tudo dando errado!
var atual_sim
var atual_nao
var bola: Node2D

func _ready() -> void:
	bola = get_tree().current_scene.find_child("8_ball", true, false)
	print("Bola encontrada: ", bola)
	
	
func _on_sim_button_pressed() -> void:
	bola.atual_sim -= 1
	bola.texto_atual()
	pass # Replace with function body.

func _on_não_button_pressed() -> void:
	bola.atual_nao -= 1
	bola.texto_atual()
	pass # Replace with function body.
