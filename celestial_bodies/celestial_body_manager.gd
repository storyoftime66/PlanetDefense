extends Node

# 中心天体
var central_body: CelestialBodyBase
# 其他天体
var celestial_bodies = []
const G = 10.0


func _ready():
	pass


func _physics_process(delta):
	# 行星对卫星和其他天体施加引力
	if is_instance_valid(central_body):
		for celestial_body in celestial_bodies:
			apply_gravitation_between_celestial_bodies(celestial_body, central_body)


func apply_gravitation_between_celestial_bodies(body1: CelestialBodyBase , body2: CelestialBodyBase) -> void:
	"""两个天体相互施加引力"""
	var pos1 := body1.global_position
	var pos2 := body2.global_position
	var direction = (pos2 - pos1).normalized()
	var magnitude = G * body1.mass * body2.mass / max(pos1.distance_squared_to(pos2), 10.0)
	body1.apply_central_force(direction * magnitude)
	body2.apply_central_force(-direction * magnitude)


func register_celestial_body(celestial_body: CelestialBodyBase) -> void:
	"""注册天体"""
	match (celestial_body.type):
		CelestialBodyBase.PLANET:
			central_body = celestial_body
		_:
			celestial_bodies.append(celestial_body)


func unregister_celestial_body(celestial_body: CelestialBodyBase) -> void:
	"""注销天体"""
	match (celestial_body.type):
		CelestialBodyBase.PLANET:
			central_body = null
		_:
			celestial_bodies.erase(celestial_body)


func get_gravitational_potential_energy(celestial_body: CelestialBodyBase) -> float:
	"""获取引力势能"""
	if celestial_body not in celestial_bodies or celestial_body == central_body:
		return 0.0
	
	var potential_energy = 0.0
	var pos = celestial_body.global_position
	potential_energy += -G * central_body.mass * celestial_body.mass \
		/ (pos.distance_to(central_body.global_position))
	return potential_energy
