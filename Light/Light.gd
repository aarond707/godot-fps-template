tool
extends StaticBody

# This sets the first color of the light.
export var InitialColor:Color = Color(1, 0, 0) setget UpdateLights
# This sets the other color of the light if it is matched with a signal.
export var FinalColor:Color = Color(0, 1, 0.086275)
# This triggers the cycling animation, which flashes the lights.
export var Cycling = true setget UpdateCycling


func UpdateLights(b):
	# If the node is not loaded yet, set off the ready function.
	if not is_inside_tree():
		yield(self,"ready")
	# This sets the colors of the 
	InitialColor = b
	# albedo of the bulb material,
	$CollisionShape/LightBase/LightBulb.get_active_material(0).set_albedo(InitialColor)
	# and the emission material.
	$CollisionShape/LightBase/LightBulb.get_active_material(0).set_emission(InitialColor)

func UpdateCycling(b):
	Cycling = b
	if not is_inside_tree():
		yield(self,"ready")
	if b:
		$AnimationPlayer.play("Cycling")
	else:
		$AnimationPlayer.stop(0)

# This is a conditional signal, to which if the light is connected to a door, where it sends the 
# Locked variable.

#if I rewire this, I'm checking for a different signal. I'm looking for a true or false on whether 
#or not the mech is moving. I could also be looking for whether or not the button was pressed,
#but I don't think that's really what I want this light to reflect.

func _on_Doorway_doorStatus(status) -> void:
	# If the door is locked, then it switches to the first color setting.
	if status:
		lightOn()
	# Otherwise, switch the bulb to the second color setting.
	else:
		$CollisionShape/LightBase/LightBulb.get_active_material(0).set_albedo(FinalColor)
		$CollisionShape/LightBase/LightBulb.get_active_material(0).set_emission(FinalColor)

func lightOn() -> void:
		$CollisionShape/LightBase/LightBulb.get_active_material(0).set_albedo(InitialColor)
		$CollisionShape/LightBase/LightBulb.get_active_material(0).set_emission(InitialColor)


func _on_TripTimer_tripStatus(status):
	if status == "on":
		lightOn()

