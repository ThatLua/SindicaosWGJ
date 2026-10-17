extends Area2D

var propostas_mitologicas = [
	{
		"imagem":"res://Assets/2D Assets/Papers/Carta vampiro.png",
		"titulo":"Imposto de Sangue",
		"descricao": "Solicitamos a criação de um programa mensal de doação obrigatória de sangue para garantir o abastecimento da comunidade vampírica.",
		"sim": "Os vampiros têm acesso regular a bolsas de sangue, mas os estoques hospitalares ficam reduzidos.",
		"nao": "Os estoques hospitalares são preservados, mas os vampiros passam a buscar fontes alternativas de alimentação, causando preocupação entre os cidadãos."
	},
	{
		"imagem":"res://Assets/2D Assets/Papers/scroll.png",
		"titulo":"Imposto de cachorros",
		"descricao": "Queremos mais petiscos.",
		"sim": "Os cachorros ficam felizes.",
		"nao": "Os cachorros ficam tristes."
	}	
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	criar_proposta(1)
	pass # Replace with function body.

func criar_proposta(indice: int):
	$Sprite2D.texture = load(propostas_mitologicas[indice]["imagem"])
	$Sprite2D/Titulo.text = propostas_mitologicas[indice]["titulo"]
	$Sprite2D/Descricao.text = propostas_mitologicas[indice]["descricao"]
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	#print("oi")
	var tween = create_tween()
	tween.tween_property(self, "rotation", rotation + deg_to_rad(90),1)
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("fui clicado")
