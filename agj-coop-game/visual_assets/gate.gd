extends AnimatableBody2D
class_name Gate

var gateIsOpen : bool

func _ready():
	gateIsOpen = false

func open_gate():
	var animation : AnimationPlayer = get_node("animation")
	animation.play("gate/open")
	gateIsOpen = true
