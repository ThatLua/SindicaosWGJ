extends Area2D

var sorteio
var num_sim
var num_nao
var sorteio_realizado
var atual_sim
var atual_nao


func _ready() -> void:
	sorteio_realizado = false
	$Control/RichTextLabel.text = str("")
	$Control/RichTextLabel2.text = str("")
	
func sorteio_diario():
	
	if sorteio_realizado == false: 
		sorteio = [0,1,2,3].pick_random()
		num_nao = 1 + sorteio
		num_sim = 1 + 4 - num_nao
		shake_8ball() 
		await get_tree().create_timer(1.2).timeout
		
		$Control/RichTextLabel.text = str("sim ", num_sim)
		$Control/RichTextLabel2.text = str("não ",num_nao)
		
		num_nao = atual_nao
		num_sim = atual_sim
		
		print("Sims: ",atual_sim)
		print("Nãos: ",atual_nao)
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

	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(18), 0.15)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(-18), 0.15)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(18), 0.10)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(-18), 0.10)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(-18), 0.2)
	tween.tween_property(bola, "rotation", rotbola + deg_to_rad(0), 0.2)
	
func texto_atual() -> void:
	$Control/RichTextLabel.text = str("sim ", atual_sim)
	$Control/RichTextLabel2.text = str("não ", atual_nao)
