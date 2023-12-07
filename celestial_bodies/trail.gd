extends Node2D


@export var point_count := 30
@onready var parent = get_parent()
var accumulation := 0.0
const point_interval = 0.1
@onready var line2d := $Line2D as Line2D

func _ready():
	line2d.clear_points()


func _process(delta):
	accumulation += delta
	
	if accumulation >= point_interval:
		accumulation -= point_interval
		
		line2d.add_point(parent.global_position)
		if line2d.get_point_count() > point_count:
			line2d.remove_point(0)
