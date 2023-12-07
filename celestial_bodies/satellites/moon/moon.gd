class_name Moon extends "res://celestial_bodies/satellites/satellite_base.gd"


var t = 0.0


func _process(delta):
	return
	t += delta
	if t >= 3.0:
		t -= 3.0
		print("=====================================")
		var p = CelestialBodyManager.get_gravitational_potential_energy(self)
		var vp = 0.5 * linear_velocity.length_squared() * mass
		print(p)
		print(vp)
		print(vp + p)
