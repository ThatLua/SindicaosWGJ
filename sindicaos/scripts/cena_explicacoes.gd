extends Node2D

var explicacao = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur mattis purus vehicula suscipit. Etiam varius metus vel pulvinar imperdiet. Sed hendrerit nec nunc sed molestie. Cras nec lorem diam. Nullam rutrum tellus eu lacus efficitur, id finibus mi tincidunt."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Superfície".position = get_viewport_rect().size / 2
	$Papel.position = get_viewport_rect().size / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
