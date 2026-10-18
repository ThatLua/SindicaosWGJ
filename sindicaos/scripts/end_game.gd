extends Control

@onready var texto_final: RichTextLabel = $RelatorioFinal/RelatorioFinal
@onready var botao_reiniciar: Button = $ReplayButton/Replay

var textos_finais = [
	"Um governo funcional\n
RELATÓRIO OFICIAL DE ENCERRAMENTO\n
Após dias de deliberações, protestos e uma quantidade preocupante de papelada, o governo conseguiu manter certa estabilidade entre as comunidades.
\nNem todos conseguiram o que queriam, mas a sociedade está em harmonia e equilíbrio. As instituições seguem funcionando, os conflitos permanecem administráveis e o gabinete recebeu apenas algumas ameaças formais de processo.
\n Nem todos saíram satisfeitos, mas as comunidades encontraram espaço para coexistir. Um feito inédito, que será devidamente registrado em ata.",
"A generosidade tem seu preço!\n
RELATÓRIO OFICIAL DE ENCERRAMENTO\n
Em uma demonstração histórica de boa vontade, o governo atendeu a uma quantidade extraordinária de solicitações. Todos tinham algo a comemorar, pelo menos inicialmente.
\nCom o tempo, os recursos se esgotaram, os serviços públicos entraram em colapso e as exceções concedidas viraram regra. Agora, cada grupo exige que suas vantagens sejam mantidas, e ninguém aceita ser o primeiro a abrir mão delas.
\nO governo declarou estado de emergência. Infelizmente, o pedido de emergência também precisa ser aprovado…",
    "Nada foi aprovado?\n
RELATÓRIO OFICIAL DE ENCERRAMENTO\n
Em nome da prudência em excesso, o governo recusou uma quantidade excepcional de propostas. Nenhuma mudança indesejada foi autorizada, nenhum novo gasto foi aprovado e nenhuma promessa precisou ser cumprida.
\nPorém, os problemas que dependiam de soluções continuam se acumulando, as comunidades perderam a paciência, as oportunidades passaram e até os funcionários do gabinete desistiram de apresentar sugestões.
\nO governo permanece exatamente como estava. Em resposta, as comunidades decidiram resolver seus problemas por conta própria, sem consultar o gabinete. Que problemão!"]

func _ready() -> void:
	mostrar_final()
	botao_reiniciar.pressed.connect(reiniciar_jogo)

func mostrar_final() -> void:
	var sims = 0
	var nãos = 0

	for decisao in Global.decisoes:
		if decisao["resposta"] == "Sim":
			sims += 1
		else:
			nãos += 1

	if sims >= 2:
		texto_final.text = textos_finais[0]
	elif sims >= 4:
		texto_final.text = textos_finais[1]
	else:
		texto_final.text = textos_finais[2]
	print("SIM: ", sims, " | NÃO: ", nãos)

func reiniciar_jogo() -> void:
	Global.decisoes.clear()
	get_tree().change_scene_to_file("res://scenes/inicio.tscn")
