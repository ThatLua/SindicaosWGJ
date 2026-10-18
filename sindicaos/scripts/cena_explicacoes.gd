extends Node2D

var explicacao = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur mattis purus vehicula suscipit. Etiam varius metus vel pulvinar imperdiet. Sed hendrerit nec nunc sed molestie. Cras nec lorem diam. Nullam rutrum tellus eu lacus efficitur, id finibus mi tincidunt."
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
