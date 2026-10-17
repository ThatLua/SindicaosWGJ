extends Area2D

var screensize = Vector2(1152, 648)

var propostas_mitologicas = [
	{
		"imagem":"res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante":"Vladimir Vourkolakas",
		"organizacao": "Sindicato Vampírico",
		"req": "047/2024",
		"descricao": "Solicitamos a criação de um programa mensal de doação obrigatória de sangue para garantir o abastecimento da comunidade vampírica.",
		"sim": "Os vampiros têm acesso regular a bolsas de sangue, mas os estoques hospitalares ficam reduzidos.",
		"nao": "Os estoques hospitalares são preservados, mas os vampiros passam a buscar fontes alternativas de alimentação, causando preocupação entre os cidadãos."
	},
	{
		"imagem":"res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante":"Vladimir Vourkolakas",
		"req": "REQ 376/2022",
		"organizacao": "Sindicato Vampírico",
		"descricao": "Solicitamos que todos os serviços públicos funcionem exclusivamente após o pôr do sol, respeitando nosso horário natural de atividade.",
		"sim": "Os vampiros conseguem resolver suas pendências com facilidade, mas trabalhadores diurnos perdem acesso a diversos serviços.",
		"nao": "Os serviços continuam acessíveis durante o dia, mas os vampiros organizam um protesto por falta de representatividade."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta botoi.png",
		"representante":"Boto Cor-de-Rosa",
		"req": "029/2023",
		"organizacao": "Associação dos Botos",
		"descricao": "Solicitamos que todos os dias sejam considerados feriados municipais, com festas oficiais em homenagem à alegria e à vida noturna.",
		"sim": "O turismo e o comércio de entretenimento crescem, mas serviços essenciais sofrem com a falta de funcionários.",
		"nao": "Escolas e serviços mantêm suas rotinas, mas o setor turístico perde uma oportunidade de atrair visitantes."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta botoi.png",
		"representante": "Boto Cor-de-Rosa",
		"req": "093/2024",
		"organizacao": "Associação dos Botos",
		"descricao": "Solicitamos uma licença oficial para realizar serenatas e cortejos românticos em qualquer espaço público, independentemente do horário.",
		"sim": "O turismo romântico aumenta, mas moradores perdem noites tranquilas e registram reclamações.",
		"nao": "O sossego público é preservado, mas o Boto acusa o governo de perseguir as tradições culturais."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta iara.png",
		"representante": "Iara Guasu",
		"req": "183/2025",
		"organizacao": "Comunidade Aquática",
		"descricao": "Solicitamos a criação de um programa municipal que permita à Iara convocar homens para encontros românticos às margens dos rios, mesmo sem aviso prévio.",
		"sim": "Iara ganha liberdade para organizar seus encontros, mas aumentam os desaparecimentos de homens que seguem seu canto até o rio.",
		"nao": "Os encontros passam a depender do consentimento dos participantes, mas Iara começa a atrair secretamente os funcionários do gabinete, prejudicando o expediente."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta iara.png",
		"representante": "Iara Guasu",
		"req": "183/2025",
		"organizacao": "Comunidade Aquática",
		"descricao": "Solicitamos que todos os dias sejam considerados feriados municipais, com festas oficiais em homenagem à alegria e à vida noturna.",
		"sim": "O turismo e o comércio de entretenimento crescem, mas serviços essenciais sofrem com a falta de funcionários.",
		"nao": "Escolas e serviços mantêm suas rotinas, mas o setor turístico perde uma oportunidade de atrair visitantes."
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "",
		"req": "",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"descricao": "",
		"sim": "",
		"nao": ""
	},		
	{
		"imagem": "",
		"representante": "Olívia Lontrinha",
		"req": "904/2024",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"descricao": "Solicitamos que todos os peixes dos rios públicos sejam considerados patrimônio alimentar das lontras registradas no município.",
		"sim": "As lontras têm acesso facilitado à alimentação, mas pescadores locais perdem parte de suas capturas e protestam contra a medida.",
		"nao": "A pesca mantém suas regras atuais, mas as lontras passam a invadir mercados de peixe em busca de alimento."
	},		
	{
		"imagem": "",
		"representante": "Olívia Lontrinha",
		"req": "395/2025",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"descricao": "Solicitamos a instalação de escorregadores aquáticos em todas as repartições públicas, para tornar as filas mais agradáveis.",
		"sim": "As repartições ficam mais divertidas e atraem visitantes, mas o espaço de atendimento diminui e os custos de manutenção aumentam.",
		"nao": "O orçamento público é preservado, mas a representante das lontras inicia uma campanha de protesto usando escorregadores improvisados nos corredores."
	},		
	{
		"imagem": "",
		"representante": "Augusto Almeida",
		"req": "117/2026",
		"organizacao": "Federação dos Cidadãos Humanos",
		"descricao": "Solicitamos que todos os seres mitológicos se registrem no governo e informem suas habilidades, hábitos e possíveis riscos à população.",
		"sim": "O governo passa a mapear melhor os riscos e as necessidades dos grupos, mas criaturas sem documentação enfrentam dificuldades para acessar serviços públicos.",
		"nao": "Os grupos preservam sua privacidade, mas o governo continua sem dados suficientes para planejar serviços e responder a incidentes."
	},		
	{
		"imagem": "",
		"representante": "Augusto Almeida",
		"req": "614/2022",
		"organizacao": "Federação dos Cidadãos Humanos",
		"descricao": "Solicitamos a cobrança de uma taxa sobre qualquer uso de magia em espaços públicos, independentemente da finalidade.",
		"sim": "O governo arrecada recursos para infraestrutura, mas curandeiros, pequenos comerciantes e cidadãos que dependem de magia passam a pagar mais e se revoltam.",
		"nao": "A magia continua acessível sem tributação, mas o governo perde uma fonte de receita para financiar serviços públicos."
	},		
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	criar_proposta(1)
	pass # Replace with function body.

func criar_proposta(indice: int):
	position.x = screensize.x/2
	position.y = screensize.y/2
	$Sprite2D.texture = load(propostas_mitologicas[indice]["imagem"])
	$Sprite2D/Representante.text = propostas_mitologicas[indice]["representante"]
	$Sprite2D/RQE.text = propostas_mitologicas[indice]["rqe"]
	$Sprite2D/Descricao.text = propostas_mitologicas[indice]["descricao"]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self, "rotation", rotation + deg_to_rad(10),1)
	tween.tween_property(self, "rotation", rotation + deg_to_rad(10),1)
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("fui clicado")
