extends Node2D

var som_clique = preload("res://Assets/Som/BotãoClick.MP3")
var player : AudioStreamPlayer

func play_click():
	print("me clicou?")
	player.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("chamou audio player?")
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = som_clique
	
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node:Node):
	if node is Button or node is Label:
		node.pressed.connect(play_click)
