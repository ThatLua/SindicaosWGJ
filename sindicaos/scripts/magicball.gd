extends Area2D

var sorteio
var num_sim = 0
var num_nao = 0
var sorteio_realizado
var atual_sim
var atual_nao
var falas = ["Os ventos anunciam um dia de grandes oportunidades… e consequências duvidosas…",
	"As Moiras estão generosas hoje! Não se acostume, é um fenômeno raro.",
	"Os astros encerraram a apuração. Não adianta pedir recontagem!"]
var DiaJogo = 0
var papers: Node2D = null
var clicavel
var botoes


func _ready() -> void:
	clicavel = false
	papers = get_tree().current_scene.find_child("Papers", true, false)
	botoes = get_tree().current_scene.find_child("Botões Sim_Não", true, false)
	#posições inicias 
	$"8ball".position = Vector2(0,0)
	$CollisionShape2D.position = Vector2(0,-3.7)
	$Control.position = Vector2(-92, -105)
	#esconder tudo
	$Deusa.modulate.a = 0.0
	$"8ball".modulate.a = 0.0
	$Speech.modulate.a = 0.0
	$Speech/Dialogo.modulate.a = 0.0
	$Control/RichTextLabel.modulate.a = 0.0
	$Control/RichTextLabel2.modulate.a = 0.0
	$Control/RichTextLabel3.modulate.a = 0.0
	#definir texto do dia
	$Speech/Dialogo.text = str(falas[DiaJogo])
	#resetar sorteio
	sorteio_realizado = false
	startSorteio()

func startSorteio():
	var tween_deusa = create_tween()
	tween_deusa.tween_property($Deusa, "modulate:a", 1.0, 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT) #trans.sine é curva de seno pra animação ficar mais fluida
	await tween_deusa.finished
	#await get_tree().create_timer(0.3).timeout
	
	var tween_speech = create_tween()
	tween_speech.tween_property($Speech, "modulate:a", 1.0, 1.0)
	await tween_speech.finished
	var tween_speechtext = create_tween()
	tween_speechtext.tween_property($Speech/Dialogo, "modulate:a", 1.0, 2.0)
	await tween_speechtext.finished
	await get_tree().create_timer(0.5).timeout
	
	var tween_bola = create_tween()
	tween_bola.tween_property($"8ball", "modulate:a", 1.0, 0.5)
	await tween_bola.finished
	#await get_tree().create_timer(1.0).timeout
	clicavel = true

func _process(delta: float) -> void:
	if clicavel == true:
		var tween_texto1 = create_tween()
		tween_texto1.tween_property($Control/RichTextLabel3, "modulate:a", 1.0, 1.0)
	else: 
		var tween_texto1 = create_tween()
		tween_texto1.tween_property($Control/RichTextLabel3, "modulate:a", 0.0, 0.3)

func sorteio_diario():
	
	if sorteio_realizado == false: 
		clicavel = false
		await get_tree().create_timer(0.5).timeout
		sorteio = [0,1,2].pick_random()
		num_nao = 1 + sorteio
		num_sim = 1 + 3 - num_nao
		shake_8ball() 
		await get_tree().create_timer(1.2).timeout
		#$Control/RichTextLabel.text = str("sim ", num_sim)
		#$Control/RichTextLabel2.text = str("não ",num_nao)
		atual_nao = num_nao 
		atual_sim = num_sim
		await texto_atual()
		print("Sims: ",atual_sim)
		print("Nãos: ",atual_nao)
		print("Total de respostas: ", num_sim + num_nao)
		await get_tree().create_timer(2.0).timeout #caso a animação esteja acontecendo antes do texto aparecer por completo.
		StartGame()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:	
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and clicavel == true:
			print("clicou!")
			sorteio_diario()
			sorteio_realizado = true
	#arrumar o bug de animação quando o clique vem antes do "clique aqui sumir!"


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
	var tween_texto = create_tween()
	$Control/RichTextLabel.text = str("sim ", atual_sim)
	$Control/RichTextLabel2.text = str("não ", atual_nao)
	tween_texto.tween_property($Control/RichTextLabel, "modulate:a", 1.0, 0.6)
	tween_texto.tween_property($Control/RichTextLabel2, "modulate:a", 1.0, 0.5)

func position_bola() -> void:
	#$"8ball".position = Vector2(1085.6, 271.6)
	#$CollisionShape2D.position = Vector2(1085.6, 267.9)
	#$Control.position = Vector2(996, 164)
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($"8ball","position",Vector2(1085.6, 271.6),1.0	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($CollisionShape2D,"position",Vector2(1085.6, 267.9),1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($Control,"position",Vector2(996, 164),1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	#bouncing da bola flutuando se der tempo!

func StartGame():
	#sumir Deusa e fala
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Deusa,"modulate:a",0.0,1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($Luz,"modulate:a",0.0,1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($Speech,"modulate:a",0.0,1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($Speech/Dialogo,"modulate:a",0.0,1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#mover a bola e esperar
	position_bola()
	await tween.finished
	#await get_tree().create_timer(0.5).timeout
	#começar jogo oficial
	#papers.animacao_subida()
	if is_instance_valid(papers):
		papers.iniciar()
	else:
		push_error("Papers não encontrado na cena!")
	if is_instance_valid(botoes):
		botoes.botao_visivel()
	pass
	

	
