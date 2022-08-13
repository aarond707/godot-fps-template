extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button_buttonPress(node):
	var new_dialog = Dialogic.start('/timeline-1660331307')
	add_child(new_dialog)
