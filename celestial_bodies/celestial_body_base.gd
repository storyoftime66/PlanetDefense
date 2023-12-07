class_name CelestialBodyBase extends RigidBody2D

# 天体类型
enum { NONE, PLANET, SATELLITE, ASTEROID }

var health := 100
var type = NONE


func _enter_tree():
	CelestialBodyManager.register_celestial_body(self)


func _exit_tree():
	CelestialBodyManager.unregister_celestial_body(self)
