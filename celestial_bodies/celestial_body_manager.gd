extends Node

var planets = []
var satellites = []
var celestial_bodies = []

const G = 50.0

func _ready():
	pass


func _physics_process(delta):
	for planet in planets:
		for satellite in satellites:
			apply_gravitation(satellite, planet, delta)
		for celestial_body in celestial_bodies:
			apply_gravitation(celestial_body, planet, delta)


func apply_gravitation(target: CelestialBodyBase , source: CelestialBodyBase, delta: float) -> void:
	var source_pos := source.global_position
	var target_pos := target.global_position
	var acceleration_direction := (source_pos - target_pos).normalized()
	target.apply_central_force(G * acceleration_direction * source.mass * target.mass
		/ maxf(source_pos.distance_squared_to(target_pos), 100.0))


func register_celestial_body(celestial_body: CelestialBodyBase) -> void:
	match (celestial_body.type):
		CelestialBodyBase.PLANET:
			planets.append(celestial_body)
		CelestialBodyBase.SATELLITE:
			satellites.append(celestial_body)
		_:
			celestial_bodies.append(celestial_body)


func unregister_celestial_body(celestial_body: CelestialBodyBase) -> void:
	match (celestial_body.type):
		CelestialBodyBase.PLANET:
			planets.erase(celestial_body)
		CelestialBodyBase.SATELLITE:
			satellites.erase(celestial_body)
		_:
			celestial_bodies.erase(celestial_body)
