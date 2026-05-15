extends CharacterBody2D
class_name PlayerController

@export var game:GameManager
## Movemtent variables
const tileSize: Vector2 = Vector2(64,64)
var spriteNodePosTween: Tween

## Player skin variables
@export var skinOptions : Array[Texture2D]
@export_range(1,2) var playerNum : int

## Animation variables
@export var offset: int = 148
@onready var animator : AnimationPlayer = $animator
@onready var polygons_forward = $polygons_forward
@onready var polygons_backward = $polygons_backward
@onready var skeleton = $skeleton

func _ready():
	SetControlSgnals(playerNum)
	setSkin(playerNum-1) ## Used to display skin based on player number. 

func setSkin(index : int):
	if index >= skinOptions.size():
		pass
	for node in polygons_forward.get_children():
		if node.is_class("Polygon2D"):
			node.texture = skinOptions[index]
	for node in polygons_backward.get_children():
		if node.is_class("Polygon2D"):
			node.texture = skinOptions[index]

func on_conductor_set_bpm(bpm: int):
	animator.speed_scale = bpm / 60

func animateMovement(direction: Vector2):
	if direction == Vector2.RIGHT:
		polygons_forward.scale = Vector2(1, 1)
		polygons_backward.scale = Vector2(1, 1)
		skeleton.scale = Vector2(1, 1)
		polygons_forward.position = Vector2.ZERO
		polygons_backward.position = Vector2.ZERO
		skeleton.position = Vector2.ZERO
	elif direction == Vector2.LEFT:
		polygons_forward.scale = Vector2(-1, 1)
		polygons_backward.scale = Vector2(-1, 1)
		skeleton.scale = Vector2(-1, 1)
		polygons_forward.position = Vector2(offset, 0)
		polygons_backward.position = Vector2(offset, 0)
		skeleton.position = Vector2(offset, 0)
	elif direction == Vector2.DOWN:
		polygons_forward.visible = true
		polygons_backward.visible = false
	elif direction == Vector2.UP:
		polygons_forward.visible = false
		polygons_backward.visible = true
	animator.animation_set_next("player/move", "player/bop")
	animator.play("player/move")
	
func animatePush():
	animator.animation_set_next("player/push", "player/bop")
	animator.play("player/push")

func SetControlSgnals(pNum : int):
	if pNum == 1:
		game.player1Input.connect("moveP1Down",moveDown)
		game.player1Input.connect("moveP1Up",moveUp)
		game.player1Input.connect("moveP1Left",moveLeft)
		game.player1Input.connect("moveP1Right",moveRight)
	elif pNum == 2:
		game.player2Input.connect("moveP2Down",moveDown)
		game.player2Input.connect("moveP2Up",moveUp)
		game.player2Input.connect("moveP2Left",moveLeft)
		game.player2Input.connect("moveP2Right",moveRight)
	pass

func moveUp():
	print("Moved player" + str(playerNum) + " Up")
	animateMovement(Vector2.UP)
	if !$RayCast2DUp.is_colliding():
		global_position += Vector2.UP * tileSize
	
	
func moveDown():
	print("Moved player" + str(playerNum) + " Down")
	animateMovement(Vector2.DOWN)
	if !$RayCast2DDown.is_colliding():
		global_position += Vector2.DOWN * tileSize
	

func moveLeft():
	print("Moved player" + str(playerNum) + " Left")
	animateMovement(Vector2.LEFT)
	if !$RayCast2DLeft.is_colliding():
		global_position += Vector2.LEFT * tileSize
	

func moveRight():
	print("Moved player" + str(playerNum) + " Right")
	animateMovement(Vector2.RIGHT)
	if !$RayCast2DRight.is_colliding():
		global_position += Vector2.RIGHT * tileSize
