extends Node

var DiaJogo: int = 1
var cursor_normal =  preload("res://Assets/2D Assets/cursor/selecionar.png")
var cursor_clique = preload("res://Assets/2D Assets/cursor/clic.png")
var decisoes = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_normal)
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		Input.set_custom_mouse_cursor(cursor_clique)
	else:
		Input.set_custom_mouse_cursor(cursor_normal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
