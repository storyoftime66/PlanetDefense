class_name Earth extends CelestialBodyBase


func _init():
	type = PLANET
	
func _enter_tree():
	CelestialBodyManager.register_central_body(self)
