extends Polygon2D

@export var filterOver: Node2D

func _ready():
	if filterOver:
		position.x = filterOver.position.x
		position.y = filterOver.position.y
