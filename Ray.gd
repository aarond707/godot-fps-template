extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Player_interact(node):
	if node == $RaySit01/RayStaticBody:
		var new_dialog = Dialogic.start('/timeline-1660331307')
		add_child(new_dialog)

#	if node == $ButtonHull/ButtonMesh/Area\
#	and not $AnimationPlayer.is_playing():
#		# if Instant is true, an animation will play to which the button will be pressed once.
#		if Instant:
#			$AnimationPlayer.play("press")
#		# otherwise, an animation will be played the button will be held.
#		else:
#			$AnimationPlayer.play("regular press")
#		# We then send a signal in case it is connected to a door.
#		emit_signal("buttonPress",self)
#		$PressSound.play()
