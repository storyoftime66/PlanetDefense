class_name CelestialBodyBase extends RigidBody2D

# 天体类型枚举
enum { NONE, PLANET, SATELLITE, ASTEROID }

# 血量
var health := 100.0
# 天体类型
var type = NONE


func _enter_tree():
	CelestialBodyManager.register_celestial_body(self)


func _exit_tree():
	CelestialBodyManager.unregister_celestial_body(self)


func _on_mouse_entered():
	print("Mouse entered")


func _on_mouse_exited():
	print("Mouse exited")
