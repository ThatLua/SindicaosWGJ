extends Node2D

@onready var relatorio: RichTextLabel = $Sprite2D/Relatório
@onready var descricao: RichTextLabel = $Sprite2D/Descricao

var decisoes = []

func inicializar() -> void:
	$Sprite2D/Descricao.text = ""
	$Sprite2D/Descricao.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$"Sprite2D/Relatório".text = "Relatório Diário"
	print("Quantidade de decisões ", Global.decisoes.size())
	for decisao in Global.decisoes:
		$Sprite2D/Descricao.text += str(decisao["organizacao"]) +"\n"+ "Você disse: "+str(decisao["resposta"])+ ".\n"
		$Sprite2D/Descricao.text += str(decisao["consequencia"]) + "\n"

	$Color.position.x =  get_viewport_rect().size.x / 2
	$Color.position.y =  get_viewport_rect().size.y / 2
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
	print("inicializado")
	
	#print("Decisões no relatório: ")
	#print(decisoes)
	#descricao.text = decisoes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inicializar()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
