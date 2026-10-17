extends Area2D

var screensize = Vector2(1152, 648)

var propostas_mitologicas = [
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante": "Vladimir Vourkolakas",
		"organizacao": "Sindicato Vampírico",
		"req": "047/2024",
		"descricao": "Solicitamos a criação de um programa mensal de doação obrigatória de sangue para garantir o abastecimento da comunidade vampírica.",
		"sim": "Os vampiros têm acesso regular a bolsas de sangue, mas os estoques hospitalares ficam reduzidos.",
		"nao": "Os estoques hospitalares são preservados, mas os vampiros passam a buscar fontes alternativas de alimentação, causando preocupação entre os cidadãos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante": "Vladimir Vourkolakas",
		"req": "REQ 376/2022",
		"organizacao": "Sindicato Vampírico",
		"descricao": "Solicitamos que todos os serviços públicos funcionem exclusivamente após o pôr do sol, respeitando nosso horário natural de atividade.",
		"sim": "Os vampiros conseguem resolver suas pendências com facilidade, mas trabalhadores diurnos perdem acesso a diversos serviços.",
		"nao": "Os serviços continuam acessíveis durante o dia, mas os vampiros organizam um protesto por falta de representatividade."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta botoi.png",
		"representante": "Boto Cor-de-Rosa",
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
		"req": "REQ 183/2025",
		"organizacao": "Comunidade Aquática",
		"descricao": "Solicitamos que todos os dias sejam considerados feriados municipais, com festas oficiais em homenagem à alegria e à vida noturna.",
		"sim": "O turismo e o comércio de entretenimento crescem, mas serviços essenciais sofrem com a falta de funcionários.",
		"nao": "Escolas e serviços mantêm suas rotinas, mas o setor turístico perde uma oportunidade de atrair visitantes."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta velha.png",
		"representante": "Dona Zefina Pisadeira",
		"req": "REQ 314/2024",
		"organizacao": "Sindicato Soníferos LTDA",
		"descricao": "Solicitamos que todos os cidadãos façam uma refeição pesada antes de dormir, para garantir condições adequadas ao nosso trabalho noturno.",
		"sim": "A procura por restaurantes noturnos cresce, mas aumentam os gastos domésticos e os relatos de noites mal dormidas.",
		"nao": "Os cidadãos mantêm seus hábitos alimentares, mas a Pisadeira intensifica suas visitas e provoca uma onda de reclamações sobre pesadelos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta velha.png",
		"representante": "Dona Zefina Pisadeira",
		"req": "REQ 681/2026",
		"organizacao": "Sindicato Soníferos LTDA",
		"descricao": "Solicitamos que todas as residências apaguem as luzes às 22h, facilitando o descanso e a circulação das criaturas noturnas.",
		"sim": "O consumo de energia diminui, mas trabalhadores noturnos e estabelecimentos que funcionam até tarde são prejudicados.",
		"nao": "A vida noturna continua ativa, mas aumentam as reclamações sobre cansaço e perturbações durante a madrugada."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta loira.png",
		"representante": "Maria Augusta de Oliveira Borges",
		"req": "REQ 791/1891",
		"organizacao": "Associação dos Fenômenos Escolares",
		"descricao": "Solicitamos a instalação de espelhos de corpo inteiro em todos os banheiros públicos, para facilitar nossas aparições oficiais.",
		"sim": "Os banheiros recebem melhorias e novos espelhos, mas o orçamento de manutenção de outras instalações é reduzido.",
		"nao": "O orçamento é preservado para outras reformas, mas a Loira passa a assombrar os espelhos já existentes nas repartições."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta loira.png",
		"representante": "Maria Augusta de Oliveira Borges",
		"req": "REQ 204/2022",
		"organizacao": "Associação dos Fenômenos Escolares",
		"descricao": "Solicitamos a inclusão de uma aula semanal de invocação sobrenatural em todas as escolas públicas.",
		"sim": "Estudantes aprendem sobre lendas e fenômenos sobrenaturais, mas aulas regulares perdem espaço na grade escolar.",
		"nao": "O currículo escolar permanece intacto, mas a Loira inicia aparições inesperadas nas escolas, causando faltas e reclamações."
	},
	{
		"imagem": "",
		"representante": "Claude Guimarães",
		"req": "REQ 086/2022",
		"organizacao": "União dos Lobisomens",
		"descricao": "Solicitamos licença remunerada para todos os lobisomens durante as noites de lua cheia, sem limite anual de ocorrências.",
		"sim": "Os lobisomens conseguem se preparar para a transformação, mas empresas e serviços enfrentam falta de funcionários em determinadas noites.",
		"nao": "Os serviços mantêm suas escalas, mas os lobisomens organizam uma greve e ameaçam abandonar seus postos."
	},
	{
		"imagem": "",
		"representante": "Claude Guimarães",
		"req": "REQ 739/2025",
		"organizacao": "União dos Lobisomens",
		"descricao": "Solicitamos que os uivos após a meia-noite sejam isentos das leis de perturbação do sossego.",
		"sim": "Os lobisomens ganham liberdade para se expressar, mas moradores de bairros próximos perdem noites de sono.",
		"nao": "O silêncio noturno é mantido por lei, mas os lobisomens passam a realizar manifestações barulhentas em frente ao gabinete."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta sacoi.png",
		"representante": "Laurimar Saco Fundo",
		"req": "REQ 527/2023",
		"organizacao": "Cooperativa xxxx",
		"descricao": "Solicitamos autorização para recolher objetos abandonados, esquecidos ou deixados sem supervisão por mais de cinco minutos.",
		"sim": "Ruas e praças ficam mais limpas, mas cidadãos perdem pertences que ainda pretendiam recuperar.",
		"nao": "Os cidadãos mantêm seus objetos, mas o acúmulo de lixo e itens abandonados continua aumentando."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta sacoi.png",
		"representante": "Laurimar Saco Fundo",
		"req": "527/2023",
		"organizacao": "Cooperativa xxxx",
		"descricao": "Solicitamos que todos os cidadãos contribuam com um objeto pessoal por mês para abastecer nosso programa comunitário de armazenamento.",
		"sim": "Depósitos municipais recebem materiais para reutilização, mas a população se revolta com a perda obrigatória de pertences.",
		"nao": "Ninguém precisa entregar seus objetos, mas o programa de reutilização fica sem recursos para atender famílias necessitadas."
	},
	{
		"imagem": "",
		"representante": "Curupira Py",
		"req": "REQ 425/2026",
		"organizacao": "Conselho de Proteção Florestal",
		"descricao": "Solicitamos a proibição de novas construções em qualquer terreno que possua ao menos uma árvore.",
		"sim": "A cobertura vegetal é protegida, mas obras de moradia e infraestrutura ficam paralisadas.",
		"nao": "A cidade consegue expandir suas construções, mas a perda de vegetação aumenta e Curupira começa a desorientar equipes de obras."
	},
	{
		"imagem": "",
		"representante": "Curupira Py",
		"req": "REQ 458/2024",
		"organizacao": "Conselho de Proteção Florestal",
		"descricao": "Solicitamos a cobrança de uma taxa para qualquer pessoa que atravesse trilhas, parques ou áreas arborizadas.",
		"sim": "A arrecadação financia a preservação ambiental, mas moradores de áreas afastadas enfrentam dificuldades para se deslocar.",
		"nao": "As trilhas continuam acessíveis gratuitamente, mas os recursos para manutenção e fiscalização ambiental diminuem."
	},
	{
		"imagem": "",
		"representante": "Perna Cabeluda",
		"req": "REQ 638/2023",
		"organizacao": "Liga das Entidades Desmembradas",
		"descricao": "Solicitamos a criação de faixas de trânsito exclusivas para entidades desmembradas desacompanhadas, sem exigência de veículo ou condutor.",
		"sim": "A Perna Cabeluda circula com mais segurança, mas faixas de trânsito são retiradas de carros, bicicletas e ônibus por falta de espaço nas vias.",
		"nao": "As vias mantêm sua organização, mas a Perna Cabeluda passa a saltar sobre o trânsito, provocando congestionamentos."
	},
	{
		"imagem": "",
		"representante": "Perna Cabeluda",
		"req": "REQ 162/2023",
		"organizacao": "Liga das Entidades Desmembradas",
		"descricao": "Solicitamos o reconhecimento oficial de membros sentientes como cidadãos independentes, com direito a documentos e benefícios próprios.",
		"sim": "Seres antes sem identidade legal passam a ter acesso a serviços, mas o sistema público enfrenta disputas inéditas sobre cadastro e elegibilidade.",
		"nao": "As regras administrativas permanecem inalteradas, mas a Perna Cabeluda organiza uma campanha pública por reconhecimento."
	},
	{
		"imagem": "",
		"representante": "Boitatá Junior",
		"req": "REQ 251/2025",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"descricao": "Solicitamos a substituição da iluminação pública por chamas supervisionadas por Boitatás, mais econômicas e ecologicamente responsáveis.",
		"sim": "O consumo de eletricidade diminui, mas o risco de incêndios e os custos de segurança aumentam.",
		"nao": "A iluminação convencional continua funcionando, mas o gasto público com energia permanece elevado e Boitatá acusa o governo de desperdiçar recursos."
	},
	{
		"imagem": "",
		"representante": "Boitatá Junior",
		"req": "REQ 873/2026",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"descricao": "Solicitamos a cobrança de multas de qualquer estabelecimento que produza fumaça, incluindo padarias, churrasqueiras e fábricas.",
		"sim": "A qualidade do ar melhora em algumas áreas, mas pequenos comércios e restaurantes enfrentam custos e restrições.",
		"nao": "Os estabelecimentos mantêm suas atividades, mas a poluição atmosférica continua prejudicando bairros próximos às áreas industriais."
	},
	{
		"imagem": "",
		"representante": "Olívia Lontrinha",
		"req": "REQ 904/2024",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"descricao": "Solicitamos que todos os peixes dos rios públicos sejam considerados patrimônio alimentar das lontras registradas no município.",
		"sim": "As lontras têm acesso facilitado à alimentação, mas pescadores locais perdem parte de suas capturas e protestam contra a medida.",
		"nao": "A pesca mantém suas regras atuais, mas as lontras passam a invadir mercados de peixe em busca de alimento."
	},
	{
		"imagem": "",
		"representante": "Olívia Lontrinha",
		"req": "REQ 395/2025",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"descricao": "Solicitamos a instalação de escorregadores aquáticos em todas as repartições públicas, para tornar as filas mais agradáveis.",
		"sim": "As repartições ficam mais divertidas e atraem visitantes, mas o espaço de atendimento diminui e os custos de manutenção aumentam.",
		"nao": "O orçamento público é preservado, mas a representante das lontras inicia uma campanha de protesto usando escorregadores improvisados nos corredores."
	},
	{
		"imagem": "",
		"representante": "Augusto Almeida",
		"req": "REQ 117/2026",
		"organizacao": "Federação dos Cidadãos Humanos",
		"descricao": "Solicitamos que todos os seres mitológicos se registrem no governo e informem suas habilidades, hábitos e possíveis riscos à população.",
		"sim": "O governo passa a mapear melhor os riscos e as necessidades dos grupos, mas criaturas sem documentação enfrentam dificuldades para acessar serviços públicos.",
		"nao": "Os grupos preservam sua privacidade, mas o governo continua sem dados suficientes para planejar serviços e responder a incidentes."
	},
	{
		"imagem": "",
		"representante": "Augusto Almeida",
		"req": "REQ 614/2022",
		"organizacao": "Federação dos Cidadãos Humanos",
		"descricao": "Solicitamos a cobrança de uma taxa sobre qualquer uso de magia em espaços públicos, independentemente da finalidade.",
		"sim": "O governo arrecada recursos para infraestrutura, mas curandeiros, pequenos comerciantes e cidadãos que dependem de magia passam a pagar mais e se revoltam.",
		"nao": "A magia continua acessível sem tributação, mas o governo perde uma fonte de receita para financiar serviços públicos."
	}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("tamanho do vetor de propostas:")
	print(propostas_mitologicas.size())
	criar_proposta(1)
	pass # Replace with function body.

func criar_proposta(indice: int):
	position = get_viewport_rect().size / 2
	$Sprite2D.texture = load(propostas_mitologicas[indice]["imagem"])
	$Sprite2D/Organizacao.text = propostas_mitologicas[indice]["organizacao"]
	$Sprite2D/Representante.text = propostas_mitologicas[indice]["representante"]
	$Sprite2D/REQ.text = propostas_mitologicas[indice]["req"]
	$Sprite2D/Descricao.text = propostas_mitologicas[indice]["descricao"]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	pass
	#var tween = create_tween()
	#tween.tween_property(self, "rotation", rotation + deg_to_rad(10),1)
	#tween.tween_property(self, "rotation", rotation + deg_to_rad(10),1)
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("fui clicado")
