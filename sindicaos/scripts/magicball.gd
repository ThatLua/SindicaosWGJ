extends Area2D

var sorteio
var num_sim = 0
var num_nao = 0
var sorteio_realizado
var atual_sim
var atual_nao
var DeusaVisivel
var BolaVisivel

func _ready() -> void:
	DeusaVisivel = false
	BolaVisivel = false
	$Deusa.position = Vector2(0, 0)
	$Luz.position = Vector2(0, 0)
	sorteio_realizado = false
	$Control/RichTextLabel.text = str("")
	$Control/RichTextLabel2.text = str("")
	

func startSorteio():
	mostrarDeusa()
	await get_tree().create_timer(1.5).timeout
	mostrarBola()
	await get_tree().create_timer(1.0).timeout
	sorteio_diario()

func sorteio_diario():
	if sorteio_realizado == false: 
		sorteio = [0,1,2,3].pick_random()
		num_nao = 1 + sorteio
		num_sim = 1 + 4 - num_nao
		shake_8ball() 
		await get_tree().create_timer(1.2).timeout
		#$Control/RichTextLabel.text = str("sim ", num_sim)
		#$Control/RichTextLabel2.text = str("não ",num_nao)
		atual_nao = num_nao 
		atual_sim = num_sim
		texto_atual()
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
	
func mostrarDeusa():
	pass
	
func mostrarBola():
	pass
