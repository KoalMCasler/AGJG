extends CharacterBody2D
class_name PlayerController

@export var game:GameManager
## movemtent variables. 
const  tileSize: Vector2 = Vector2(64,64)
var spriteNodePosTween: Tween

## Player skin variables.
@export var skinOptions : Array[Texture2D]
@export_range(1,2) var playerNum : int



func _ready():
	SetControlSgnals(playerNum)
	set_skin(playerNum-1) ## Used to display skin based on player number. 

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
	if !$RayCast2DUp.is_colliding():
		global_position += Vector2.UP * tileSize
	
	
func moveDown():
	print("Moved player" + str(playerNum) + " Down")
	if !$RayCast2DDown.is_colliding():
		global_position += Vector2.DOWN * tileSize
	

func moveLeft():
	print("Moved player" + str(playerNum) + " Left")
	if !$RayCast2DLeft.is_colliding():
		global_position += Vector2.LEFT * tileSize
	

func moveRight():
	print("Moved player" + str(playerNum) + " Right")
	if !$RayCast2DRight.is_colliding():
		global_position += Vector2.RIGHT * tileSize
	
