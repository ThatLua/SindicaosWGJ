extends Node2D

@onready var fade_rect: ColorRect = $CanvasLayer/ColorRect
var cena_principal_jogo = "res://scenes/game.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Superfície".position = get_viewport_rect().size / 2
	$Papel.position = get_viewport_rect().size / 2
	pass # Replace with function body.

func _on_button_pressed() -> void:
	print("BOTÃO DE PROSSEGUIR CLICADO!")
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	get_tree().change_scene_to_file(cena_principal_jogo)
