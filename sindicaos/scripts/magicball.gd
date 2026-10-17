extends Area2D

var sorteio
var num_sim
var num_nao
var sorteio_realizado


func _ready() -> void:
	sorteio_realizado = false
	$CanvasLayer/Total.text = str("")
	pass
	
func sorteio_diario():
	
	if sorteio_realizado == false: 
		sorteio = [0,1,2,3].pick_random()
		num_nao = 1 + sorteio
		num_sim = 1 + 4 - num_nao
		shake_8ball() 
		await get_tree().create_timer(1).timeout
		$CanvasLayer/Total.text = str(num_sim, " SIM\n", num_nao, " NÃO")
		#$CanvasLayer/NumNao.text = str(num_nao)
		#$CanvasLayer/NumSim.text = str(num_sim)
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

func shake_8ball ():
	var bola = $"8ball"
	var rotbola = bola.rotation
	var tween = create_tween()

	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(-18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(-18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(0), 0.2)
	
