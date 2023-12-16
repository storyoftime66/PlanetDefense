class_name SatelliteBase extends "res://celestial_bodies/celestial_body_base.gd"

# 初速度
@export var initial_velocity := Vector2(0, 0)
# 中心天体
var central_body: CelestialBodyBase



func _init():
	type = SATELLITE


func _ready():
	linear_velocity = initial_velocity
