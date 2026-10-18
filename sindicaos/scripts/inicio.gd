extends Control

@onready var fade_rect: ColorRect = $CanvasLayer/ColorRect
@onready var audio_stream_player_2d: AudioStreamPlayer = $AudioStreamPlayer

var cena_explicacao_jogo = "res://scenes/cena_explicacoes.tscn"
var cena_creditos = "res://scenes/creditos.tscn"

func _ready() -> void:
	audio_stream_player_2d.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_novo_jogo_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, 1)
	await tween.finished
	get_tree().change_scene_to_file(cena_explicacao_jogo)
	print("novo jogo")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file(cena_creditos)
	print("tela de creditos")
	
func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_audio_stream_player_finished() -> void:
	audio_stream_player_2d.play()
