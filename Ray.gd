extends Spatial

var in_dialog = false

func _on_Dialog_dialogic_signal(value):
	if value == "start":
		in_dialog = true
	if value == "end":
		in_dialog == false

func _on_Player_interact(node):
	if node == $RaySit01/RayStaticBody and in_dialog == false:
		var new_dialog = Dialogic.start('/timeline-1660331307')
		add_child(new_dialog)
