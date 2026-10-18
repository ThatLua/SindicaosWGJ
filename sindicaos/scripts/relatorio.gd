extends Node2D

@onready var relatorio: RichTextLabel = $Sprite2D/Relatório
@onready var descricao: RichTextLabel = $Sprite2D/Descricao

var pode_continuar := true

func inicializar() -> void:
	$Sprite2D/Descricao.text = ""
	$Sprite2D/Descricao.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$Sprite2D/Relatório.text = "Relatório Diário"

	print("Quantidade de decisões: ", Global.decisoes.size())

	for decisao in Global.decisoes:
		$Sprite2D/Descricao.text += str(decisao["organizacao"]) + "\n"
		$Sprite2D/Descricao.text += "Você disse: " + str(decisao["resposta"]) + ".\n"
		$Sprite2D/Descricao.text += str(decisao["consequencia"]) + "\n\n"

	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
	print("Relatório inicializado")

func _ready() -> void:
	inicializar()

func _input(event: InputEvent) -> void:
	if not pode_continuar:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			pode_continuar = false
			avancar_dia()

func avancar_dia() -> void:
	if Global.DiaJogo < 3:
		Global.DiaJogo += 1
		Global.decisoes.clear()
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/end_game.tscn")
