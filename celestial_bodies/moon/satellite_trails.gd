extends Line2D


@export var point_count := 30
@onready var parent = get_parent()
var accumulation := 0.0
const point_interval = 0.1

func _ready():
	clear_points()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	accumulation += delta
	
	if accumulation >= point_interval:
		accumulation -= point_interval
		
		add_point(parent.global_position)
		if get_point_count() > point_count:
			remove_point(0)
