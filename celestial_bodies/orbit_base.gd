class_name Orbit extends Line2D


# 椭圆参数
@export var a_radius := 200.0
@export var b_radius := 150.0
@export var point_count := 100
@export var degree := 0.0

# 所属天体
var body: SatelliteBase = null


# Called when the node enters the scene tree for the first time.
func _ready():
	draw_orbit()


func draw_orbit() -> void:
	clear_points()
	
	var quarter = []
	var arc_points = []
	
	var major_radius = max(a_radius, b_radius)
	var step = major_radius / int(point_count * 0.25)
	var a2 = a_radius * a_radius
	var a2_inverse = 1 / a2
	var b2 = b_radius * b_radius
	var a2b2 = a2 * b2
	
	for i in range(1, int(point_count / 4)):
		var x = i * step
		var y = sqrt((a2b2 - x * x * b2) * a2_inverse)
		quarter.append(Vector2(x, y))
	
	var vertexs = [Vector2(0.0, b_radius), Vector2(a_radius, 0.0), Vector2(0.0, -b_radius), Vector2(-a_radius, 0.0)]
	var quadrants = [Vector2(1, 1), Vector2(1, -1), Vector2(-1, -1), Vector2(-1, 1)]
	for i in range(4):
		arc_points.append(vertexs[i])
		var quadrant_points = []
		for j in range(int(point_count / 4) - 1):
			quadrant_points.append(quarter[j] * quadrants[i])
		if i % 2 == 1:
			quadrant_points.reverse()
		arc_points.append_array(quadrant_points)
	arc_points.append(arc_points[0])
	
	for point in arc_points:
		add_point(point)
	
	rotation_degrees = degree

