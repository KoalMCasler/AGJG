extends CharacterBody2D

@export var skinOptions : Array[Texture2D]

func set_skin(index : int):
	if index >= skinOptions.size():
		pass
	var polygons_forward = get_node("polygons_forward")
	for node in polygons_forward.get_children():
		if node.is_class("Polygon2D"):
			node.texture = skinOptions[index]
	var polygons_backward = get_node("polygons_backward")
	for node in polygons_backward.get_children():
		if node.is_class("Polygon2D"):
			node.texture = skinOptions[index]

func _ready():
	set_skin(1)
