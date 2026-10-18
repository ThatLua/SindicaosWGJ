extends Node2D

var explicacao = "Em um mundo habitado por criaturas míticas e seres do folclore, cada comunidade tem seus próprios interesses e reivindicações.\n
Como funcionário do governo, seu trabalho é analisar as propostas que chegam até você e decidir quais serão aprovadas ou recusadas.\n
A cada dia, a Deusa da Sorte determinará quantos SIMs e NÃOs você poderá utilizar. Mas escolha com cuidado, pois cada decisão traz consequências para a sociedade.\n
Que os astros guiem seu julgamento!"

@onready var fade_rect: ColorRect = $CanvasLayer/ColorRect
var cena_principal_jogo = "res://scenes/game.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Superfície".position = get_viewport_rect().size / 2
	$Papel.position = get_viewport_rect().size / 2
	$Papel/RichTextLabel.text = explicacao
	pass # Replace with function body.

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, 2)
	await tween.finished
	get_tree().change_scene_to_file(cena_principal_jogo)
