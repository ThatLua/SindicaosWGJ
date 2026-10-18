extends Area2D

var screensize = Vector2(1152, 648)

var propostas_mitologicas = [
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante": "Vladimir Vourkolakas",
		"organizacao": "Sindicato Vampírico",
		"req": "REQ 047/2024",
		"descricao": "Solicitamos a criação de um programa mensal de doação obrigatória de sangue para garantir o abastecimento da comunidade vampírica.",
		"sim": "Os vampiros têm acesso regular a bolsas de sangue, mas os estoques hospitalares ficam reduzidos.",
		"nao": "Os estoques hospitalares são preservados, mas os vampiros passam a buscar fontes alternativas de alimentação, causando preocupação entre os cidadãos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta vampiro.png",
		"representante": "Vladimir Vourkolakas",
		"organizacao": "Sindicato Vampírico",
		"req": "REQ 376/2022",
		"descricao": "Solicitamos que todos os serviços públicos funcionem exclusivamente após o pôr do sol, respeitando nosso horário natural de atividade.",
		"sim": "Os vampiros conseguem resolver suas pendências com facilidade, mas trabalhadores diurnos perdem acesso a diversos serviços.",
		"nao": "Os serviços continuam acessíveis durante o dia, mas os vampiros organizam um protesto por falta de representatividade."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta iara.png",
		"representante": "Iara Guasu",
		"organizacao": "Comunidade Aquática",
		"req": "REQ 183/2025",
		"descricao": "Solicitamos a criação de um programa municipal que permita à Iara convocar homens para encontros românticos às margens dos rios, mesmo sem aviso prévio.",
		"sim": "Iara ganha liberdade para organizar seus encontros, mas aumentam os desaparecimentos de homens que seguem seu canto até o rio.",
		"nao": "Os homens continuam a evitar o rio por medo da Iara os afogar, e em retaliação ela impede a comunidade de utilizar suas águas para pesca e transporte."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta iara.png",
		"representante": "Iara Guasu",
		"organizacao": "Comunidade Aquática",
		"req": "REQ 845/2025",
		"descricao": "Solicitamos que todas as embarcações que naveguem pelos rios do município obtenham autorização prévia da comunidade aquática.",
		"sim": "A circulação nos rios fica mais segura e a fauna aquática é menos perturbada, mas pescadores e comerciantes enfrentam atrasos e restrições.",
		"nao": "O transporte fluvial continua livre, mas Iara passa a atrair embarcações para rotas inesperadas, causando prejuízos e confusão."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta botoi.png",
		"representante": "Boto Cor-de-Rosa",
		"organizacao": "Associação dos Botos",
		"req": "REQ 029/2023",
		"descricao": "Solicitamos que todos os dias sejam considerados feriados municipais, com festas oficiais em homenagem à alegria e à vida noturna.",
		"sim": "O turismo e o comércio de entretenimento crescem, mas serviços essenciais sofrem com a falta de funcionários.",
		"nao": "Escolas e serviços mantêm suas rotinas, mas ele começa a roubar as esposas dos comerciantes."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta botoi.png",
		"representante": "Boto Cor-de-Rosa",
		"organizacao": "Associação dos Botos",
		"req": "REQ 093/2024",
		"descricao": "Solicitamos a isenção de taxas e obrigações financeiras relacionadas à paternidade, incluindo pensão alimentícia e custos de criação de possíveis herdeiros.",
		"sim": "O Boto economiza uma fortuna, mas o número de mães solteiras em busca de auxílios do governo dispara.",
		"nao": "As obrigações financeiras continuam valendo, mas o Boto acusa o governo de perseguir suas tradições românticas e ameaça transformar o gabinete em palco de serenatas de protesto."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta sacoi.png",
		"representante": "Laurimar Saco Fundo",
		"organizacao": "Cooperativa xxxx",
		"req": "REQ 562/2026",
		"descricao": "Solicitamos autorização para recolher crianças que desobedecerem aos responsáveis e encaminhá-las ao nosso programa especial de reeducação dentro do saco.",
		"sim": "Os responsáveis ganham uma nova forma de ameaçar os filhos, mas os desaparecimentos infantis aumentam drasticamente.",
		"nao": "As crianças ficam protegidas dos sequestros oficiais, mas o Velho do Saco passa a levar os filhos dos políticos em protesto, resultando em custos astronômicos em terapia."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta sacoi.png",
		"representante": "Laurimar Saco Fundo",
		"organizacao": "Cooperativa xxxx",
		"req": "REQ 527/2023",
		"descricao": "Solicitamos a implementação de um toque de recolher para crianças, permitindo o recolhimento daquelas encontradas na rua após o horário estabelecido.",
		"sim": "As ruas ficam mais tranquilas durante a noite, mas crianças que voltam tarde da escola ou de atividades extracurriculares começam a desaparecer.",
		"nao": "As crianças mantêm sua liberdade de circulação, mas o Velho do Saco passa a se esconder em mochilas escolares para surpreendê-las durante o trajeto para casa."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta velha.png",
		"representante": "Dona Zefina Pisadeira",
		"organizacao": "Sindicato Soníferos LTDA",
		"req": "REQ 314/2024",
		"descricao": "Solicitamos que todos os cidadãos façam uma refeição pesada antes de dormir, para garantir condições adequadas ao nosso trabalho noturno.",
		"sim": "A procura por restaurantes noturnos cresce, mas aumentam os gastos domésticos e os relatos de noites mal dormidas.",
		"nao": "Os cidadãos mantêm seus hábitos alimentares, mas a Pisadeira intensifica suas visitas e provoca uma onda de reclamações sobre pesadelos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta velha.png",
		"representante": "Dona Zefina Pisadeira",
		"organizacao": "Sindicato Soníferos LTDA",
		"req": "REQ 681/2026",
		"descricao": "Solicitamos que todas as residências apaguem as luzes às 22h, facilitando o descanso e a circulação das criaturas noturnas.",
		"sim": "O consumo de energia diminui, mas trabalhadores noturnos e estabelecimentos que funcionam até tarde são prejudicados.",
		"nao": "As pessoas mantêm suas rotinas, mas a Pisadeira passa a visitar com mais frequência quem fica acordado até tarde, provocando noites mal dormidas e uma onda de reclamações contra o governo."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta loira.png",
		"representante": "Maria Augusta de Oliveira Borges",
		"organizacao": "Associação dos Fenômenos Escolares",
		"req": "REQ 791/1891",
		"descricao": "Solicitamos a instalação de espelhos de corpo inteiro em todos os banheiros públicos, para facilitar nossas aparições oficiais.",
		"sim": "Os banheiros recebem melhorias e novos espelhos, mas o orçamento de manutenção de outras instalações é reduzido.",
		"nao": "O orçamento é preservado para outras reformas, mas a Loira passa a assombrar os espelhos já existentes nas repartições."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/Carta loira.png",
		"representante": "Maria Augusta de Oliveira Borges",
		"organizacao": "Associação dos Fenômenos Escolares",
		"req": "REQ 204/2022",
		"descricao": "Solicitamos a inclusão de uma aula semanal de invocação sobrenatural em todas as escolas públicas.",
		"sim": "Estudantes aprendem sobre lendas e fenômenos sobrenaturais, mas aulas regulares perdem espaço na grade escolar.",
		"nao": "A grade escolar permanece intacta, mas os representantes sobrenaturais acusam o governo de desvalorizar o conhecimento ancestral, pressionando o governo pela criação de uma disciplina alternativa."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Claude Guimarães",
		"organizacao": "União dos Lobisomens",
		"req": "REQ 086/2022",
		"descricao": "Solicitamos licença remunerada para todos os lobisomens durante as noites de lua cheia, sem limite anual de ocorrências.",
		"sim": "Os lobisomens conseguem se preparar para a transformação, mas empresas e serviços enfrentam falta de funcionários em determinadas noites.",
		"nao": "Os serviços mantêm suas escalas, mas os lobisomens organizam uma greve e ameaçam abandonar seus postos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Claude Guimarães",
		"organizacao": "União dos Lobisomens",
		"req": "REQ 739/2025",
		"descricao": "Solicitamos que os uivos após a meia-noite sejam isentos das leis de perturbação do sossego.",
		"sim": "Os lobisomens ganham liberdade para se expressar, mas moradores de bairros próximos perdem noites de sono.",
		"nao": "O silêncio noturno é mantido por lei, mas os lobisomens passam a realizar manifestações barulhentas em frente ao gabinete."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Curupira Py",
		"organizacao": "Conselho de Proteção Florestal",
		"req": "REQ 425/2026",
		"descricao": "Solicitamos a proibição de novas construções em qualquer terreno que possua ao menos uma árvore.",
		"sim": "A cobertura vegetal é protegida, mas obras de moradia e infraestrutura ficam paralisadas.",
		"nao": "A cidade consegue expandir suas construções, mas a perda de vegetação aumenta e Curupira começa a desorientar equipes de obras."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Curupira Py",
		"organizacao": "Conselho de Proteção Florestal",
		"req": "REQ 458/2024",
		"descricao": "Solicitamos a cobrança de uma taxa para qualquer pessoa que atravesse trilhas, parques ou áreas arborizadas.",
		"sim": "A arrecadação financia a preservação ambiental, mas moradores de áreas afastadas enfrentam dificuldades para se deslocar.",
		"nao": "As trilhas permanecem acessíveis a todos, mas o Curupira começa a confundir os caminhos para afastar os visitantes, fazendo alguns moradores chegarem atrasados ao trabalho e outros darem voltas em círculos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Perna Cabeluda",
		"organizacao": "Liga das Entidades Desmembradas",
		"req": "REQ 638/2023",
		"descricao": "Solicitamos a criação de faixas de trânsito exclusivas para entidades desmembradas desacompanhadas, sem exigência de veículo ou condutor.",
		"sim": "A Perna Cabeluda circula com mais segurança, mas faixas de trânsito são retiradas de carros, bicicletas e ônibus por falta de espaço nas vias.",
		"nao": "As vias mantêm sua organização, mas a Perna Cabeluda passa a saltar sobre o trânsito, provocando congestionamentos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Perna Cabeluda",
		"organizacao": "Liga das Entidades Desmembradas",
		"req": "REQ 162/2023",
		"descricao": "Solicitamos o reconhecimento oficial de membros sentientes como cidadãos independentes, com direito a documentos e benefícios próprios.",
		"sim": "Seres antes sem identidade legal passam a ter acesso a serviços, mas o sistema público enfrenta disputas inéditas sobre cadastro e elegibilidade.",
		"nao": "As regras administrativas permanecem inalteradas, mas a Perna Cabeluda organiza uma campanha pública por reconhecimento."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Boitatá Junior",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"req": "REQ 251/2025",
		"descricao": "Solicitamos a substituição da iluminação pública por chamas supervisionadas por Boitatás, mais econômicas e ecologicamente responsáveis.",
		"sim": "O consumo de eletricidade diminui, mas o risco de incêndios e os custos de segurança aumentam.",
		"nao": "A iluminação convencional continua funcionando, mas o gasto público com energia permanece elevado e Boitatá acusa o governo de desperdiçar recursos."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Boitatá Junior",
		"organizacao": "Ordem dos Guardiões do Fogo",
		"req": "REQ 873/2026",
		"descricao": "Solicitamos a cobrança de multas de qualquer estabelecimento que produza fumaça, incluindo padarias, churrasqueiras e fábricas.",
		"sim": "A qualidade do ar melhora em algumas áreas, mas pequenos comércios e restaurantes enfrentam custos e restrições.",
		"nao": "Os estabelecimentos mantêm suas atividades, mas a poluição atmosférica continua prejudicando bairros próximos às áreas industriais."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Olívia Lontrinha",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"req": "REQ 904/2024",
		"descricao": "Solicitamos que todos os peixes dos rios públicos sejam considerados patrimônio alimentar das lontras registradas no município.",
		"sim": "As lontras têm acesso facilitado à alimentação, mas pescadores locais perdem parte de suas capturas e protestam contra a medida.",
		"nao": "A pesca mantém suas regras atuais, mas as lontras passam a invadir mercados de peixe em busca de alimento."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Olívia Lontrinha",
		"organizacao": "Associação das Lontras Ribeirinhas",
		"req": "REQ 395/2025",
		"descricao": "Solicitamos a instalação de escorregadores aquáticos em todas as repartições públicas, para tornar as filas mais agradáveis.",
		"sim": "As repartições ficam mais divertidas e atraem visitantes, mas o espaço de atendimento diminui e os custos de manutenção aumentam.",
		"nao": "O orçamento público é preservado, mas a representante das lontras inicia uma campanha de protesto usando escorregadores improvisados nos corredores."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Augusto Almeida",
		"organizacao": "Federação dos Cidadãos Humanos",
		"req": "REQ 117/2026",
		"descricao": "Solicitamos que todos os seres mitológicos se registrem no governo e informem suas habilidades, hábitos e possíveis riscos à população.",
		"sim": "O governo passa a mapear melhor os riscos e as necessidades dos grupos, mas criaturas sem documentação enfrentam dificuldades para acessar serviços públicos.",
		"nao": "Os grupos preservam sua privacidade, mas o governo continua sem dados suficientes para planejar serviços e responder a incidentes."
	},
	{
		"imagem": "res://Assets/2D Assets/Papers/folha.png",
		"representante": "Augusto Almeida",
		"organizacao": "Federação dos Cidadãos Humanos",
		"req": "REQ 614/2022",
		"descricao": "Solicitamos a cobrança de uma taxa sobre qualquer uso de magia em espaços públicos, independentemente da finalidade.",
		"sim": "O governo arrecada recursos para infraestrutura, mas curandeiros, pequenos comerciantes e cidadãos que dependem de magia passam a pagar mais e se revoltam.",
		"nao": "A magia continua acessível à população, mas o uso descontrolado de feitiços em espaços públicos aumenta, causando pequenos acidentes e obrigando o governo a reforçar a fiscalização."
	}
]

var numeros_sorteados = []

func sorteio_gameplay():
	var quantidade_de_propostas = propostas_mitologicas.size()
	for i in range(quantidade_de_propostas):
		numeros_sorteados.append(i)
	numeros_sorteados.shuffle()
	print(numeros_sorteados)	
	print(propostas_mitologicas[23])


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sorteio_gameplay()
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
