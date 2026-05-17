extends RigidBody2D
class_name Statue

var upClear : bool
var downClear : bool
var leftClear : bool
var rightClear : bool

const tileSize: Vector2 = Vector2(256,256)

func _process(delta: float):
	if $RayCast2DUp.is_colliding():
		upClear = false
	else:
		upClear = true
	if $RayCast2DDown.is_colliding():
		downClear = false
	else:
		downClear = true
	if $RayCast2DLeft.is_colliding():
		leftClear = false
	else:
		leftClear = true
	if $RayCast2DRight.is_colliding():
		rightClear = false
	else:
		rightClear = true

func moveDirection(dir:int):
	if dir == 1 && upClear:
		global_position += Vector2.UP * tileSize
	elif  dir == 2 && downClear:
		global_position += Vector2.DOWN * tileSize
	elif  dir == 3 && leftClear:
		global_position += Vector2.LEFT * tileSize
	elif  dir == 4 && rightClear:
		global_position += Vector2.RIGHT * tileSize
