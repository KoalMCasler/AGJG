extends RigidBody2D
class_name Statue

var upClear : bool
var downClear : bool
var leftClear : bool
var rightClear : bool

var spritePosTween : Tween

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
		$sprite.global_position -= Vector2.UP * tileSize
		if spritePosTween:
			spritePosTween.kill()
		spritePosTween = create_tween()
		spritePosTween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		spritePosTween.tween_property($sprite,"global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
	elif  dir == 2 && downClear:
		global_position += Vector2.DOWN * tileSize
		$sprite.global_position -= Vector2.DOWN * tileSize
		if spritePosTween:
			spritePosTween.kill()
		spritePosTween = create_tween()
		spritePosTween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		spritePosTween.tween_property($sprite,"global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
	elif  dir == 3 && leftClear:
		global_position += Vector2.LEFT * tileSize
		$sprite.global_position -= Vector2.LEFT * tileSize
		if spritePosTween:
			spritePosTween.kill()
		spritePosTween = create_tween()
		spritePosTween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		spritePosTween.tween_property($sprite,"global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
	elif  dir == 4 && rightClear:
		global_position += Vector2.RIGHT * tileSize
		$sprite.global_position -= Vector2.RIGHT * tileSize
		if spritePosTween:
			spritePosTween.kill()
		spritePosTween = create_tween()
		spritePosTween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		spritePosTween.tween_property($sprite,"global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
