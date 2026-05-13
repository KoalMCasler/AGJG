extends AnimatableBody2D

func _ready():
	open_gate()

func open_gate():
	var animation : AnimationPlayer = get_node("animation")
	animation.play("gate/open")
